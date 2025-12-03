import { Router } from 'express';
import {
  register,
  login,
  getCurrentUser,
  verifyToken,
  createUser,
  setUserClaims,
  deleteUser,
  getUserStats,
  recordSignView,
  recordExerciseCompletion,
  recordDailyQuiz,
  getViewedSignsProgress,
  getAllMedals,
  getUserMedals,
  claimMedal,
  addFavoriteSign,
  removeFavoriteSign,
  getFavoriteSigns,
  awardMedal,
} from '../controllers/auth.controller';
import { verifyFirebaseToken, requireAdmin } from '../middleware/auth.middleware';

const router = Router();

// Public authentication routes
//test
router.post('/register', register);
router.post('/login', login);

// Protected routes (authentication required)
router.get('/me', verifyFirebaseToken, getCurrentUser);
router.get('/me/stats', verifyFirebaseToken, getUserStats);
router.post('/verify', verifyFirebaseToken, verifyToken);

// Event endpoints for user activity
router.post('/me/signs/:signId/view', recordSignView);
router.get('/me/signs/views', getViewedSignsProgress);
router.post('/me/exercises/:exerciseId/complete', recordExerciseCompletion);
router.post('/me/daily-quiz', recordDailyQuiz);
//router.post('/me/progress', verifyFirebaseToken, updateProgress);

// Favorite signs
router.post('/me/favorites/:signId', addFavoriteSign);
router.delete('/me/favorites/:signId', removeFavoriteSign);
router.get('/me/favorites', getFavoriteSigns);

// Medals
router.get('/medals', getAllMedals);
router.get('/me/medals', getUserMedals);
router.post('/me/medals/:medalId/claim', claimMedal);

// Admin routes
router.post('/users', verifyFirebaseToken, requireAdmin, createUser);
router.post('/users/claims', verifyFirebaseToken, requireAdmin, setUserClaims);
router.delete('/users/:uid', verifyFirebaseToken, requireAdmin, deleteUser);
// Admin award medal
router.post('/users/:uid/medals/:medalId', verifyFirebaseToken, requireAdmin, awardMedal);

export default router;
