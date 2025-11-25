import { Pool } from 'pg';
import dotenv from 'dotenv';

dotenv.config();

/**
 * PostgreSQL connection pool configuration
 */
const pool = new Pool({
  user: process.env.DB_USER || 'postgres',
  host: process.env.DB_HOST || 'localhost',
  database: process.env.DB_NAME || 'amoxcalli_db',
  password: process.env.DB_PASSWORD || 'password',
  port: parseInt(process.env.DB_PORT || '5432'),
  
  // SSL configuration (required for Aiven)
  ssl: {
    rejectUnauthorized: false, // Accept self-signed certificates from Aiven
  },
  
  // Connection pool settings
  max: 20, // Maximum number of clients in the pool
  idleTimeoutMillis: 30000, // Close idle clients after 30 seconds
  connectionTimeoutMillis: 10000, // Increased to 10 seconds for Railway/Aiven
  query_timeout: 30000, // Query timeout in milliseconds
  statement_timeout: 30000, // Statement timeout
});

// Log when a client is checked out from the pool
pool.on('connect', () => {
  console.log('✅ Database connection established');
});

// Log errors
pool.on('error', (err) => {
  console.error('❌ Unexpected database error:', err);
  process.exit(-1);
});

// Test the connection
pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.error('❌ Database connection failed:', err);
  } else {
    console.log('🔗 Database connected at:', res.rows[0].now);
  }
});

export default pool;
