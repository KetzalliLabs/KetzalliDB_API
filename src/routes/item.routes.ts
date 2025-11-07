import { Router } from 'express';
import {
  getAllItems,
  getItemById,
  createItem,
  updateItem,
  deleteItem
} from '../controllers/item.controller';
import { verifyFirebaseToken, optionalAuth } from '../middleware/auth.middleware';

const router = Router();

// GET /api/items - Get all items (public or with optional auth)
router.get('/', optionalAuth, getAllItems);

// GET /api/items/:id - Get item by ID (public or with optional auth)
router.get('/:id', optionalAuth, getItemById);

// POST /api/items - Create new item (requires authentication)
router.post('/', verifyFirebaseToken, createItem);

// PUT /api/items/:id - Update item (requires authentication)
router.put('/:id', verifyFirebaseToken, updateItem);

// DELETE /api/items/:id - Delete item (requires authentication)
router.delete('/:id', verifyFirebaseToken, deleteItem);

export default router;
