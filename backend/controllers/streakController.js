const pool = require('../config/database');

// Utility: get today's date in IST (India Standard Time)
const getTodayIST = () => {
  const now = new Date();
  const istOffset = 5.5 * 60 * 60 * 1000;
  const istDate = new Date(now.getTime() + istOffset);
  return istDate.toISOString().split('T')[0]; // 'YYYY-MM-DD'
};

const getYesterdayIST = () => {
  const now = new Date();
  const istOffset = 5.5 * 60 * 60 * 1000;
  const istDate = new Date(now.getTime() + istOffset);
  istDate.setDate(istDate.getDate() - 1);
  return istDate.toISOString().split('T')[0];
};

const getNDaysAgoIST = (n) => {
  const now = new Date();
  const istOffset = 5.5 * 60 * 60 * 1000;
  const istDate = new Date(now.getTime() + istOffset);
  istDate.setDate(istDate.getDate() - n);
  return istDate.toISOString().split('T')[0];
};


// GET /api/streak - Get user streak status (read-only)
const getStreak = async (req, res) => {
  const userId = req.user.id;
  const today = getTodayIST();
  const yesterday = getYesterdayIST();

  try {
    const [rows] = await pool.execute(
      `SELECT current_streak, longest_streak, total_points,
       DATE_FORMAT(last_active_date, '%Y-%m-%d') as last_active_date
       FROM users WHERE id = ?`,
      [userId]
    );

    if (rows.length === 0) {
      return res.status(404).json({ success: false, message: 'User not found' });
    }

    const user = rows[0];
    const lastActive = user.last_active_date;

    // Determine if streak is still alive
    const isAlive = lastActive === today || lastActive === yesterday;
    const liveStreak = isAlive ? (user.current_streak || 0) : 0;

    res.json({
      success: true,
      current_streak: liveStreak,
      longest_streak: user.longest_streak || 0,
      last_active_date: lastActive,
      total_points: user.total_points || 0,
      is_active_today: lastActive === today,
      streak_alive: isAlive
    });

  } catch (err) {
    console.error('Get streak error:', err);
    res.status(500).json({ error: 'Failed to fetch streak' });
  }
};

// POST /api/streak/checkin - Daily check-in
const checkIn = async (req, res) => {
  const userId = req.user.id;
  const today = getTodayIST();
  const yesterday = getYesterdayIST();

  try {
    const [rows] = await pool.execute(
      `SELECT current_streak, longest_streak, 
       DATE_FORMAT(last_active_date, '%Y-%m-%d') as last_active_date 
       FROM users WHERE id = ?`,
      [userId]
    );

    if (rows.length === 0) {
      return res.status(404).json({ success: false, message: 'User not found' });
    }

    const user = rows[0];
    const lastActive = user.last_active_date;

    // Already checked in today — return current values, NO increment
    if (lastActive === today) {
      return res.json({
        success: true,
        current_streak: user.current_streak || 0,
        longest_streak: user.longest_streak || 0,
        last_active_date: lastActive,
        already_checked_in: true,
        message: 'Already checked in today',
        newBadges: []
      });
    }

    // Calculate new streak
    let newStreak;
    if (lastActive === yesterday) {
      newStreak = (user.current_streak || 0) + 1;
    } else {
      newStreak = 1;
    }

    const newLongest = Math.max(newStreak, user.longest_streak || 0);

    // Single atomic update
    await pool.execute(
      `UPDATE users SET 
        current_streak = ?,
        longest_streak = ?,
        last_active_date = ?
       WHERE id = ? AND (
         DATE_FORMAT(last_active_date, '%Y-%m-%d') != ? 
         OR last_active_date IS NULL
       )`,
      [newStreak, newLongest, today, userId, today]
    );

    // Verify what was actually saved
    const [updated] = await pool.execute(
      `SELECT current_streak, longest_streak,
       DATE_FORMAT(last_active_date, '%Y-%m-%d') as last_active_date
       FROM users WHERE id = ?`,
      [userId]
    );

    // Log daily_activity for today
    await pool.execute(`
      INSERT INTO daily_activity (user_id, activity_date, questions_done)
      VALUES (?, ?, 0)
      ON DUPLICATE KEY UPDATE questions_done = questions_done
    `, [userId, today]);

    // Check badges after streak update
    const newBadges = await checkAndAwardBadges(userId);

    res.json({
      success: true,
      current_streak: updated[0].current_streak,
      longest_streak: updated[0].longest_streak,
      last_active_date: updated[0].last_active_date,
      already_checked_in: false,
      message: newStreak === 1 ? 'Streak started!' : `Day ${newStreak} streak!`,
      newBadges
    });

  } catch (err) {
    console.error('Checkin error:', err);
    res.status(500).json({ error: 'Checkin failed' });
  }
};

// GET /api/streak/weekly — last 7 days activity dots
const getWeeklyActivity = async (req, res) => {
  const userId = req.user.id;

  try {
    const startDate = getNDaysAgoIST(6);
    const [rows] = await pool.execute(
      `SELECT 
         DATE_FORMAT(activity_date, '%Y-%m-%d') as date,
         questions_done
       FROM daily_activity
       WHERE user_id = ? 
         AND activity_date >= ?
       ORDER BY activity_date ASC`,
      [userId, startDate]
    );


    // Build full 7-day array including days with no activity
    const activityMap = {};
    rows.forEach(r => { activityMap[r.date] = r.questions_done; });

    const week = [];
    for (let i = 6; i >= 0; i--) {
      const now = new Date();
      const istOffset = 5.5 * 60 * 60 * 1000;
      const d = new Date(now.getTime() + istOffset);
      d.setDate(d.getDate() - i);
      const dateStr = d.toISOString().split('T')[0];
      const dayName = d.toLocaleDateString('en-IN', { weekday: 'short' });

      week.push({
        date: dateStr,
        day: dayName,
        active: !!activityMap[dateStr],
        questions_done: activityMap[dateStr] || 0
      });
    }

    res.json(week);
  } catch (err) {
    console.error('Weekly activity error:', err);
    res.status(500).json({ error: 'Failed to fetch weekly activity' });
  }
};

// GET /api/streak/badges - Get user's earned badges (and locked badges with progress)
const getMyBadges = async (req, res) => {
  try {
    const userId = req.user.id;

    // Get all badge definitions
    const [allBadges] = await pool.execute('SELECT * FROM badges ORDER BY id ASC');

    // Get user's earned badges
    const [earnedBadges] = await pool.execute(`
      SELECT badge_key, earned_at
      FROM user_badges
      WHERE user_id = ?
    `, [userId]);

    const earnedMap = {};
    earnedBadges.forEach(eb => {
      earnedMap[eb.badge_key] = eb.earned_at;
    });

    // Get stats for progress calculation
    const [[{ practiceCount }]] = await pool.execute('SELECT COUNT(*) as practiceCount FROM user_attempts WHERE user_id = ?', [userId]);
    const [[{ testCount }]] = await pool.execute('SELECT COUNT(*) as testCount FROM test_attempts WHERE user_id = ? AND submitted_at IS NOT NULL', [userId]);
    
    const [[{ testAnswersCount }]] = await pool.execute(`
      SELECT COUNT(*) as testAnswersCount 
      FROM test_attempt_answers taa
      JOIN test_attempts ta ON taa.attempt_id = ta.id
      WHERE ta.user_id = ?
    `, [userId]);

    const totalQuestionsAttempted = parseInt(practiceCount || 0) + parseInt(testAnswersCount || 0);

    const [userRows] = await pool.execute('SELECT current_streak, total_points FROM users WHERE id = ?', [userId]);
    const user = userRows[0] || { current_streak: 0, total_points: 0 };

    // Accuracy Calculation
    const [[{ practiceCorrect }]] = await pool.execute('SELECT COUNT(*) as practiceCorrect FROM user_attempts WHERE user_id = ? AND is_correct = 1', [userId]);
    const [[{ testCorrect }]] = await pool.execute(`
      SELECT COUNT(*) as testCorrect
      FROM test_attempt_answers taa
      JOIN test_attempts ta ON taa.attempt_id = ta.id
      WHERE ta.user_id = ? AND taa.is_correct = 1
    `, [userId]);

    const totalCorrect = parseInt(practiceCorrect || 0) + parseInt(testCorrect || 0);
    const overallAccuracy = totalQuestionsAttempted > 0 ? (totalCorrect / totalQuestionsAttempted) * 100 : 0;

    const formattedBadges = allBadges.map(badge => {
      const isEarned = !!earnedMap[badge.badge_key];
      let progress = 0;
      let target = badge.condition_value;

      if (isEarned) {
        progress = target;
      } else {
        switch (badge.condition_type) {
          case 'questions_attempted':
            progress = Math.min(totalQuestionsAttempted, target);
            break;
          case 'accuracy':
            progress = totalQuestionsAttempted >= 20 ? Math.min(Math.round(overallAccuracy), target) : 0;
            break;
          case 'streak':
            progress = Math.min(user.current_streak || 0, target);
            break;
          case 'tests_completed':
            progress = Math.min(testCount || 0, target);
            break;
          default:
            progress = 0;
        }
      }

      return {
        id: badge.id,
        badgeKey: badge.badge_key,
        name: badge.name,
        description: badge.description,
        icon: badge.icon,
        pointsReward: badge.points_reward,
        isEarned,
        earnedAt: earnedMap[badge.badge_key] || null,
        progress,
        target,
        conditionType: badge.condition_type
      };
    });

    res.json(formattedBadges);
  } catch (error) {
    console.error('Get my badges error:', error);
    res.status(500).json({ success: false, message: 'Error fetching badges status' });
  }
};

// GET /api/streak/badges/all - Get all badges list
const getAllBadges = async (req, res) => {
  try {
    const [rows] = await pool.execute('SELECT * FROM badges ORDER BY id ASC');
    res.json(rows);
  } catch (error) {
    console.error('Get all badges error:', error);
    res.status(500).json({ success: false, message: 'Error fetching badges definitions' });
  }
};

// Internal function to check and award badges
const checkAndAwardBadges = async (userId) => {
  const newBadges = [];

  // Get user details
  const [userRows] = await pool.execute('SELECT current_streak FROM users WHERE id = ?', [userId]);
  if (userRows.length === 0) return [];
  const currentStreak = userRows[0].current_streak || 0;

  // Get stats
  const [[{ practiceCount }]] = await pool.execute('SELECT COUNT(*) as practiceCount FROM user_attempts WHERE user_id = ?', [userId]);
  const [[{ testCount }]] = await pool.execute('SELECT COUNT(*) as testCount FROM test_attempts WHERE user_id = ? AND submitted_at IS NOT NULL', [userId]);
  
  const [[{ testAnswersCount }]] = await pool.execute(`
    SELECT COUNT(*) as testAnswersCount 
    FROM test_attempt_answers taa
    JOIN test_attempts ta ON taa.attempt_id = ta.id
    WHERE ta.user_id = ?
  `, [userId]);

  const totalQuestionsAttempted = parseInt(practiceCount || 0) + parseInt(testAnswersCount || 0);

  const [[{ practiceCorrect }]] = await pool.execute('SELECT COUNT(*) as practiceCorrect FROM user_attempts WHERE user_id = ? AND is_correct = 1', [userId]);
  const [[{ testCorrect }]] = await pool.execute(`
    SELECT COUNT(*) as testCorrect
    FROM test_attempt_answers taa
    JOIN test_attempts ta ON taa.attempt_id = ta.id
    WHERE ta.user_id = ? AND taa.is_correct = 1
  `, [userId]);

  const totalCorrect = parseInt(practiceCorrect || 0) + parseInt(testCorrect || 0);
  const overallAccuracy = totalQuestionsAttempted > 0 ? (totalCorrect / totalQuestionsAttempted) * 100 : 0;

  const [[{ hasPerfectScore }]] = await pool.execute(`
    SELECT COUNT(*) as hasPerfectScore FROM test_attempts 
    WHERE user_id = ? AND accuracy = 100.00 AND submitted_at IS NOT NULL
  `, [userId]);

  // Find all badges the user has NOT earned yet
  const [unearnedBadges] = await pool.execute(`
    SELECT * FROM badges 
    WHERE badge_key NOT IN (SELECT badge_key FROM user_badges WHERE user_id = ?)
  `, [userId]);

  for (const badge of unearnedBadges) {
    let conditionMet = false;

    switch (badge.condition_type) {
      case 'questions_attempted':
        conditionMet = totalQuestionsAttempted >= badge.condition_value;
        break;
      case 'accuracy':
        // Require at least 20 questions to award accuracy badges to prevent initial easy unlocks
        conditionMet = totalQuestionsAttempted >= 20 && overallAccuracy >= badge.condition_value;
        break;
      case 'streak':
        conditionMet = currentStreak >= badge.condition_value;
        break;
      case 'tests_completed':
        conditionMet = testCount >= badge.condition_value;
        break;
      case 'milestone':
        if (badge.badge_key === 'perfectionist') {
          conditionMet = hasPerfectScore > 0;
        }
        break;
    }

    if (conditionMet) {
      try {
        // Award badge
        await pool.execute(`
          INSERT INTO user_badges (user_id, badge_key) VALUES (?, ?)
        `, [userId, badge.badge_key]);

        // Reward points
        await pool.execute(`
          UPDATE users SET total_points = total_points + ? WHERE id = ?
        `, [badge.points_reward, userId]);

        newBadges.push({
          badgeKey: badge.badge_key,
          name: badge.name,
          description: badge.description,
          icon: badge.icon,
          pointsReward: badge.points_reward
        });
      } catch (err) {
        // Ignore duplicate key insertion error in case of concurrent executions
        if (err.code !== 'ER_DUP_ENTRY') {
          console.error(`Error inserting user badge ${badge.badge_key}:`, err);
        }
      }
    }
  }

  return newBadges;
};

module.exports = {
  getStreak,
  checkIn,
  getWeeklyActivity,
  getMyBadges,
  getAllBadges,
  checkAndAwardBadges,
  getTodayIST,
  getYesterdayIST,
  getNDaysAgoIST
};

