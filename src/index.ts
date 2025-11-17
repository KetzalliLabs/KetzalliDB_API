import express, { Application, Request, Response } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import itemRoutes from './routes/item.routes';
import authRoutes from './routes/auth.routes';
import { errorHandler, notFoundHandler } from './middleware/error.middleware';
import './config/firebase.config'; // Initialize Firebase
import './config/r2.config'; // Initialize R2 Storage

// Load environment variables
dotenv.config();

const app: Application = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Request logging middleware (development only)
if (process.env.NODE_ENV === 'development') {
  app.use((req: Request, res: Response, next) => {
    console.log(`${new Date().toISOString()} - ${req.method} ${req.path}`);
    next();
  });
}

// Health check endpoint
app.get('/', (req: Request, res: Response) => {
  res.json({
    success: true,
    message: 'KetzalliDB API is running',
    version: '1.0.0',
    timestamp: new Date().toISOString()
  });
});

// API Health check with storage status
app.get('/api/health', (req: Request, res: Response) => {
  const healthStatus = {
    success: true,
    status: 'healthy',
    timestamp: new Date().toISOString(),
    environment: process.env.NODE_ENV || 'development',
    services: {
      api: 'operational',
      database: process.env.DB_HOST ? 'configured' : 'not configured',
      storage: process.env.R2_BUCKET_NAME ? 'configured' : 'not configured',
      firebase: process.env.FIREBASE_PROJECT_ID ? 'configured' : 'not configured'
    },
    storage: {
      provider: 'Cloudflare R2',
      bucket: process.env.R2_BUCKET_NAME || 'not configured',
      publicUrl: process.env.R2_PUBLIC_URL || 'not configured'
    }
  };

  res.json(healthStatus);
});

// API documentation endpoint
app.get('/api', (req: Request, res: Response) => {
  res.json({
    success: true,
    message: 'Amoxcalli API - Mexican Sign Language Learning Platform',
    version: '1.0.0',
    endpoints: {
      health: 'GET /api/health',
      authentication: {
        register: 'POST /api/auth/register',
        login: 'POST /api/auth/login',
        profile: 'GET /api/auth/profile'
      },
      items: {
        getAllItems: 'GET /api/items?type=signs&category_id=uuid',
        getItemById: 'GET /api/items/:id?type=signs',
        createSign: 'POST /api/items/signs (multipart/form-data)',
        updateSign: 'PUT /api/items/signs/:id (multipart/form-data)',
        deleteSign: 'DELETE /api/items/signs/:id',
        createCategory: 'POST /api/items/categories (multipart/form-data)',
        updateCategory: 'PUT /api/items/categories/:id (multipart/form-data)',
        deleteCategory: 'DELETE /api/items/categories/:id',
        createExercise: 'POST /api/items/exercises (application/json)',
        deleteExercise: 'DELETE /api/items/exercises/:id',
        updateAvatar: 'PUT /api/items/users/:userId/avatar (multipart/form-data)'
      }
    },
    documentation: 'See README.md for detailed API documentation'
  });
});

// Routes
app.use('/api/items', itemRoutes);
app.use('/api/auth', authRoutes);

// 404 handler - must be after all routes
app.use(notFoundHandler);

// Error handling middleware - must be last
app.use(errorHandler);

// Graceful shutdown handler
process.on('SIGTERM', () => {
  console.log('SIGTERM signal received: closing HTTP server');
  process.exit(0);
});

process.on('SIGINT', () => {
  console.log('SIGINT signal received: closing HTTP server');
  process.exit(0);
});

// Start server
app.listen(PORT, () => {
  console.log('='.repeat(50));
  console.log('🚀 Amoxcalli API Server Started');
  console.log('='.repeat(50));
  console.log(`📍 Server URL: http://localhost:${PORT}`);
  console.log(`📦 Environment: ${process.env.NODE_ENV || 'development'}`);
  console.log(`🗄️  Database: ${process.env.DB_HOST ? '✓ Connected' : '✗ Not configured'}`);
  console.log(`☁️  R2 Storage: ${process.env.R2_BUCKET_NAME ? '✓ Configured' : '✗ Not configured'}`);
  console.log(`🔥 Firebase: ${process.env.FIREBASE_PROJECT_ID ? '✓ Initialized' : '✗ Not configured'}`);
  console.log('='.repeat(50));
  console.log('📚 API Documentation: http://localhost:' + PORT + '/api');
  console.log('❤️  Health Check: http://localhost:' + PORT + '/api/health');
  console.log('='.repeat(50));
});

// Handle uncaught exceptions
process.on('uncaughtException', (error: Error) => {
  console.error('Uncaught Exception:', error);
  process.exit(1);
});

// Handle unhandled promise rejections
process.on('unhandledRejection', (reason: any, promise: Promise<any>) => {
  console.error('Unhandled Rejection at:', promise, 'reason:', reason);
  process.exit(1);
});

export default app;