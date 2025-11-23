import { Router } from 'express';
import {
  register,
  login,
  getCurrentUser,
  verifyToken,
  createUser,
  setUserClaims,
  deleteUser
} from '../controllers/auth.controller';
import { verifyFirebaseToken, requireAdmin } from '../middleware/auth.middleware';

const router = Router();

// Public authentication routes
router.post('/register', register);
router.post('/login', login);

// Protected routes (authentication required)
router.get('/me', verifyFirebaseToken, getCurrentUser);
router.post('/verify', verifyFirebaseToken, verifyToken);

// Admin routes
router.post('/users', verifyFirebaseToken, requireAdmin, createUser);
router.post('/users/claims', verifyFirebaseToken, requireAdmin, setUserClaims);
router.delete('/users/:uid', verifyFirebaseToken, requireAdmin, deleteUser);

export default router;
