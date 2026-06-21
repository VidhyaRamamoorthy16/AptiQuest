const buildQuestionQuery = (filters = {}, count = false) => {
    const { section, topic, difficulty, page = 1, limit = 10, offset } = filters;
    const params = [];

    let query = '';
    if (count) {
        query = `
      SELECT COUNT(*) as total
      FROM questions q
      JOIN sections s ON q.section_id = s.id
      JOIN topics t ON q.topic_id = t.id
      WHERE 1=1
    `;
    } else {
        query = `
      SELECT q.*, s.name as section_name, t.name as topic_name
      FROM questions q
      JOIN sections s ON q.section_id = s.id
      JOIN topics t ON q.topic_id = t.id
      WHERE 1=1
    `;
    }

    if (section) {
        query += ' AND s.name = ?';
        params.push(section);
    }

    if (topic) {
        query += ' AND t.name = ?';
        params.push(topic);
    }

    if (difficulty) {
        query += ' AND q.difficulty = ?';
        params.push(difficulty);
    }

    if (!count) {
        const limitVal = parseInt(limit);
        const offsetVal = offset !== undefined ? parseInt(offset) : (parseInt(page) - 1) * limitVal;
        query += ` ORDER BY q.id DESC LIMIT ${limitVal} OFFSET ${offsetVal}`;
    }

    return { query, params };
};

module.exports = { buildQuestionQuery };
