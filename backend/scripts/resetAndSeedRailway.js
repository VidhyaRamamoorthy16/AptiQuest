const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');

const dbConfig = {
  host: 'reseau.proxy.rlwy.net',
  port: 22438,
  user: 'root',
  password: 'FxnaUsaNQOLtTBDytGJWjUzMPTCmVAhK',
  database: 'railway',
  multipleStatements: true,
  connectTimeout: 60000
};

const run = async () => {
  let connection;
  try {
    console.log('Connecting to Railway MySQL database...');
    connection = await mysql.createConnection(dbConfig);
    console.log('Connected successfully!');

    console.log('Disabling foreign key checks...');
    await connection.execute('SET FOREIGN_KEY_CHECKS = 0');

    // Get list of all tables
    const [tables] = await connection.execute('SHOW TABLES');
    const tableNames = tables.map(row => Object.values(row)[0]);
    console.log(`Found tables to drop: ${tableNames.join(', ')}`);

    for (const tableName of tableNames) {
      console.log(`Dropping table: ${tableName}`);
      await connection.execute(`DROP TABLE IF EXISTS \`${tableName}\``);
    }

    console.log('Enabling foreign key checks...');
    await connection.execute('SET FOREIGN_KEY_CHECKS = 1');

    // 1. Run schema.sql
    console.log('Reading database/schema.sql...');
    const schemaSqlPath = path.join(__dirname, '../../database/schema.sql');
    let schemaSql = fs.readFileSync(schemaSqlPath, 'utf8');
    
    // Remove "CREATE DATABASE IF NOT EXISTS aptitudeweb;" and "USE aptitudeweb;" to avoid creating/using a different DB
    schemaSql = schemaSql.replace(/CREATE DATABASE IF NOT EXISTS aptitudeweb;/gi, '');
    schemaSql = schemaSql.replace(/USE aptitudeweb;/gi, '');

    console.log('Executing schema.sql...');
    await connection.query(schemaSql);
    console.log('schema.sql executed successfully!');

    // 2. Run migrations_phase3.sql
    console.log('Reading database/migrations_phase3.sql...');
    const migrationsSqlPath = path.join(__dirname, '../../database/migrations_phase3.sql');
    let migrationsSql = fs.readFileSync(migrationsSqlPath, 'utf8');
    
    // Remove "USE aptitudeweb;"
    migrationsSql = migrationsSql.replace(/USE aptitudeweb;/gi, '');

    console.log('Executing migrations_phase3.sql...');
    await connection.query(migrationsSql);
    console.log('migrations_phase3.sql executed successfully!');

    // 3. Run seed_phase4.sql
    console.log('Reading database/seed_phase4.sql...');
    const seedSqlPath = path.join(__dirname, '../../database/seed_phase4.sql');
    let seedSql = fs.readFileSync(seedSqlPath, 'utf8');
    
    // Remove "USE aptitudeweb;" if present
    seedSql = seedSql.replace(/USE aptitudeweb;/gi, '');

    console.log('Executing seed_phase4.sql (this might take a few seconds)...');
    await connection.query(seedSql);
    console.log('seed_phase4.sql executed successfully!');

    console.log('Database reset and seed completed successfully!');
  } catch (err) {
    console.error('Error resetting database:', err);
  } finally {
    if (connection) {
      await connection.end();
      console.log('Database connection closed.');
    }
  }
};

run();
