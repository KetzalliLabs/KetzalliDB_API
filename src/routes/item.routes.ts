import { Router } from 'express';
import { ItemController } from '../controllers/item.controller';
import { verifyFirebaseToken, optionalAuth } from '../middleware/auth.middleware';
import { upload, uploadFields } from '../middleware/upload.middleware';

const router = Router();

// ============================================
// PUBLIC ROUTES (Read-only, no auth required)
// ============================================

// GET /api/items - Get all items (supports query params: type, category_id)
// Example: /api/items?type=signs&category_id=uuid
router.get('/', optionalAuth, ItemController.getAllItems);

// GET /api/items/:id - Get item by ID (supports query param: type)
// Example: /api/items/uuid?type=signs
router.get('/:id', optionalAuth, ItemController.getItemById);

// ============================================
// SIGNS ROUTES (Protected - requires auth)
// ============================================

// POST /api/items/signs - Create new sign with image and video
// Body (form-data): name, description, category_id, image (file), video (file)
router.post('/signs', verifyFirebaseToken, uploadFields, ItemController.createSign);

// PUT /api/items/signs/:id - Update existing sign
// Body (form-data): name, description, category_id, image (file), video (file)
router.put('/signs/:id', verifyFirebaseToken, uploadFields, ItemController.updateSign);

// DELETE /api/items/signs/:id - Delete sign and its media files
router.delete('/signs/:id', verifyFirebaseToken, ItemController.deleteSign);

// ============================================
// CATEGORIES ROUTES (Protected - requires auth)
// ============================================

// POST /api/items/categories - Create new category with icon
// Body (form-data): name, description, file (icon image)
router.post('/categories', verifyFirebaseToken, upload.single('file'), ItemController.createCategory);

// PUT /api/items/categories/:id - Update existing category
// Body (form-data): name, description, file (icon image)
router.put('/categories/:id', verifyFirebaseToken, upload.single('file'), ItemController.updateCategory);

// DELETE /api/items/categories/:id - Delete category and its icon
router.delete('/categories/:id', verifyFirebaseToken, ItemController.deleteCategory);

// ============================================
// EXERCISES ROUTES (Protected - requires auth)
// ============================================

// POST /api/items/exercises - Create new exercise with options
// Body (JSON): { category_id, type, prompt, order_num, options: [...] }
router.post('/exercises', verifyFirebaseToken, ItemController.createExercise);

// POST /api/items/exercises/generate-quiz - Generate a quiz of exercises (public)
// Body: { mode: 'category'|'mixed'|'custom', count: number, category_id?: string, exercise_ids?: string[] }
router.post('/exercises/generate-quiz', optionalAuth, ItemController.generateQuiz);

// GET /api/items/exercises/:id/quiz - Get exercise + correct sign + 3 random incorrect signs
// Example: /api/items/exercises/:id/quiz
router.get('/exercises/:id/quiz', optionalAuth, ItemController.getExerciseQuiz);

// DELETE /api/items/exercises/:id - Delete exercise
router.delete('/exercises/:id', verifyFirebaseToken, ItemController.deleteExercise);

// ============================================
// USER AVATAR ROUTES (Protected - requires auth)
// ============================================

// PUT /api/items/users/:userId/avatar - Update user avatar
// Body (form-data): file (avatar image)
router.put('/users/:userId/avatar', verifyFirebaseToken, upload.single('file'), ItemController.updateAvatar);

// ============================================
// BACKWARDS COMPATIBILITY (Legacy routes)
// ============================================

// POST /api/items - Create new item (maps to createSign)
router.post('/', verifyFirebaseToken, uploadFields, ItemController.createSign);

// PUT /api/items/:id - Update item (maps to updateSign)
router.put('/:id', verifyFirebaseToken, uploadFields, ItemController.updateSign);

// DELETE /api/items/:id - Delete item (maps to deleteSign)
router.delete('/:id', verifyFirebaseToken, ItemController.deleteSign);

export default router;