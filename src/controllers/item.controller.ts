import { Request, Response } from 'express';
import { StorageService } from '../utils/storage.util';
import pool from '../config/database';

export class ItemController {
  /**
   * Get all items (signs, categories, etc.)
   */
  static async getAllItems(req: Request, res: Response): Promise<void> {
    try {
      const { type, category_id } = req.query;

      let query = '';
      const params: any[] = [];

      // Determine which table to query based on type
      switch (type) {
        case 'signs':
          query = 'SELECT * FROM signs';
          if (category_id) {
            query += ' WHERE category_id = $1';
            params.push(category_id);
          }
          query += ' ORDER BY name ASC';
          break;

        case 'categories':
          query = 'SELECT * FROM categories ORDER BY name ASC';
          break;

        case 'exercises':
          query = 'SELECT * FROM exercises';
          if (category_id) {
            query += ' WHERE category_id = $1';
            params.push(category_id);
          }
          query += ' ORDER BY id ASC';
          break;

        case 'medals':
          query = 'SELECT * FROM medals ORDER BY name ASC';
          break;

        default:
          // Default to signs if no type specified
          query = 'SELECT * FROM signs ORDER BY name ASC';
      }

      const result = await pool.query(query, params);

      res.status(200).json({
        success: true,
        count: result.rows.length,
        data: result.rows,
      });
    } catch (error) {
      console.error('Error fetching items:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to fetch items',
        error: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  /**
   * Get item by ID
   */
  static async getItemById(req: Request, res: Response): Promise<void> {
    try {
      const { id } = req.params;
      const { type } = req.query;

      let query = '';
      
      // Determine which table based on type
      switch (type) {
        case 'signs':
          query = 'SELECT * FROM signs WHERE id = $1';
          break;
        case 'categories':
          query = 'SELECT * FROM categories WHERE id = $1';
          break;
        case 'exercises':
          query = 'SELECT * FROM exercises WHERE id = $1';
          break;
        case 'medals':
          query = 'SELECT * FROM medals WHERE id = $1';
          break;
        default:
          query = 'SELECT * FROM signs WHERE id = $1';
      }

      const result = await pool.query(query, [id]);

      if (result.rows.length === 0) {
        res.status(404).json({
          success: false,
          message: `Item with id ${id} not found`,
        });
        return;
      }

      res.status(200).json({
        success: true,
        data: result.rows[0],
      });
    } catch (error) {
      console.error('Error fetching item:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to fetch item',
        error: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  /**
   * Create a new sign with image and video upload
   */
  static async createSign(req: Request, res: Response): Promise<void> {
    try {
      const { category_id, name, description } = req.body;
      const files = req.files as { [fieldname: string]: Express.Multer.File[] };

      // Validate required fields
      if (!category_id || !name) {
        res.status(400).json({
          success: false,
          message: 'Category ID and name are required',
        });
        return;
      }

      let imageUrl: string | null = null;
      let videoUrl: string | null = null;

      // Upload image if provided
      if (files?.image && files.image[0]) {
        imageUrl = await StorageService.uploadFile(files.image[0], {
          folder: StorageService.getFolderPath('signs'),
          optimize: true,
          maxWidth: 1920,
          quality: 85,
        });
      }

      // Upload video if provided
      if (files?.video && files.video[0]) {
        videoUrl = await StorageService.uploadFile(files.video[0], {
          folder: StorageService.getFolderPath('signs'),
          optimize: false,
        });
      }

      // Insert into database
      const query = `
        INSERT INTO signs (id, category_id, name, description, image_url, video_url)
        VALUES (gen_random_uuid(), $1, $2, $3, $4, $5)
        RETURNING *
      `;

      const result = await pool.query(query, [
        category_id,
        name,
        description || null,
        imageUrl,
        videoUrl,
      ]);

      res.status(201).json({
        success: true,
        message: 'Sign created successfully',
        data: result.rows[0],
      });
    } catch (error) {
      console.error('Error creating sign:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to create sign',
        error: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  /**
   * Create a new category with icon
   */
  static async createCategory(req: Request, res: Response): Promise<void> {
    try {
      const { name, description } = req.body;
      const file = req.file;

      if (!name) {
        res.status(400).json({
          success: false,
          message: 'Category name is required',
        });
        return;
      }

      let iconUrl: string | null = null;

      // Upload icon if provided
      if (file) {
        iconUrl = await StorageService.uploadFile(file, {
          folder: StorageService.getFolderPath('categories'),
          optimize: true,
          maxWidth: 512,
          quality: 90,
        });
      }

      const query = `
        INSERT INTO categories (id, name, description, icon_url)
        VALUES (gen_random_uuid(), $1, $2, $3)
        RETURNING *
      `;

      const result = await pool.query(query, [name, description || null, iconUrl]);

      res.status(201).json({
        success: true,
        message: 'Category created successfully',
        data: result.rows[0],
      });
    } catch (error) {
      console.error('Error creating category:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to create category',
        error: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  /**
   * Create exercise with options
   */
  static async createExercise(req: Request, res: Response): Promise<void> {
    try {
      const { category_id, type, prompt, order_num, options } = req.body;

      if (!category_id || !type || !prompt) {
        res.status(400).json({
          success: false,
          message: 'Category ID, type, and prompt are required',
        });
        return;
      }

      // Start transaction
      const client = await pool.connect();

      try {
        await client.query('BEGIN');

        // Insert exercise
        const exerciseQuery = `
          INSERT INTO exercises (id, category_id, type, prompt, order_num)
          VALUES (gen_random_uuid(), $1, $2, $3, $4)
          RETURNING *
        `;

        const exerciseResult = await client.query(exerciseQuery, [
          category_id,
          type,
          prompt,
          order_num || 0,
        ]);

        const exerciseId = exerciseResult.rows[0].id;

        // Insert options if provided
        if (options && Array.isArray(options)) {
          for (const option of options) {
            const optionQuery = `
              INSERT INTO exercise_options (id, exercise_id, text, image_url, video_url, is_correct)
              VALUES (gen_random_uuid(), $1, $2, $3, $4, $5)
            `;

            await client.query(optionQuery, [
              exerciseId,
              option.text || null,
              option.image_url || null,
              option.video_url || null,
              option.is_correct || false,
            ]);
          }
        }

        await client.query('COMMIT');

        // Fetch complete exercise with options
        const completeExercise = await client.query(
          `
          SELECT e.*, 
                 json_agg(
                   json_build_object(
                     'id', eo.id,
                     'text', eo.text,
                     'image_url', eo.image_url,
                     'video_url', eo.video_url,
                     'is_correct', eo.is_correct
                   )
                 ) as options
          FROM exercises e
          LEFT JOIN exercise_options eo ON e.id = eo.exercise_id
          WHERE e.id = $1
          GROUP BY e.id
          `,
          [exerciseId]
        );

        res.status(201).json({
          success: true,
          message: 'Exercise created successfully',
          data: completeExercise.rows[0],
        });
      } catch (error) {
        await client.query('ROLLBACK');
        throw error;
      } finally {
        client.release();
      }
    } catch (error) {
      console.error('Error creating exercise:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to create exercise',
        error: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  /**
   * Update a sign
   */
  static async updateSign(req: Request, res: Response): Promise<void> {
    try {
      const { id } = req.params;
      const { category_id, name, description } = req.body;
      const files = req.files as { [fieldname: string]: Express.Multer.File[] };

      // Get existing sign
      const existingSign = await pool.query('SELECT * FROM signs WHERE id = $1', [id]);

      if (existingSign.rows.length === 0) {
        res.status(404).json({
          success: false,
          message: 'Sign not found',
        });
        return;
      }

      const currentSign = existingSign.rows[0];
      let imageUrl = currentSign.image_url;
      let videoUrl = currentSign.video_url;

      // Upload new image if provided
      if (files?.image && files.image[0]) {
        // Delete old image if exists
        if (currentSign.image_url) {
          await StorageService.deleteFile(currentSign.image_url).catch(console.error);
        }

        imageUrl = await StorageService.uploadFile(files.image[0], {
          folder: StorageService.getFolderPath('signs'),
          optimize: true,
        });
      }

      // Upload new video if provided
      if (files?.video && files.video[0]) {
        // Delete old video if exists
        if (currentSign.video_url) {
          await StorageService.deleteFile(currentSign.video_url).catch(console.error);
        }

        videoUrl = await StorageService.uploadFile(files.video[0], {
          folder: StorageService.getFolderPath('signs'),
          optimize: false,
        });
      }

      // Update database
      const query = `
        UPDATE signs 
        SET category_id = COALESCE($1, category_id),
            name = COALESCE($2, name),
            description = COALESCE($3, description),
            image_url = COALESCE($4, image_url),
            video_url = COALESCE($5, video_url)
        WHERE id = $6
        RETURNING *
      `;

      const result = await pool.query(query, [
        category_id || null,
        name || null,
        description || null,
        imageUrl,
        videoUrl,
        id,
      ]);

      res.status(200).json({
        success: true,
        message: 'Sign updated successfully',
        data: result.rows[0],
      });
    } catch (error) {
      console.error('Error updating sign:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to update sign',
        error: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  /**
   * Update category
   */
  static async updateCategory(req: Request, res: Response): Promise<void> {
    try {
      const { id } = req.params;
      const { name, description } = req.body;
      const file = req.file;

      const existingCategory = await pool.query('SELECT * FROM categories WHERE id = $1', [id]);

      if (existingCategory.rows.length === 0) {
        res.status(404).json({
          success: false,
          message: 'Category not found',
        });
        return;
      }

      const currentCategory = existingCategory.rows[0];
      let iconUrl = currentCategory.icon_url;

      if (file) {
        if (currentCategory.icon_url) {
          await StorageService.deleteFile(currentCategory.icon_url).catch(console.error);
        }

        iconUrl = await StorageService.uploadFile(file, {
          folder: StorageService.getFolderPath('categories'),
          optimize: true,
          maxWidth: 512,
        });
      }

      const query = `
        UPDATE categories 
        SET name = COALESCE($1, name),
            description = COALESCE($2, description),
            icon_url = COALESCE($3, icon_url)
        WHERE id = $4
        RETURNING *
      `;

      const result = await pool.query(query, [name || null, description || null, iconUrl, id]);

      res.status(200).json({
        success: true,
        message: 'Category updated successfully',
        data: result.rows[0],
      });
    } catch (error) {
      console.error('Error updating category:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to update category',
        error: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  /**
   * Delete a sign
   */
  static async deleteSign(req: Request, res: Response): Promise<void> {
    try {
      const { id } = req.params;

      const sign = await pool.query('SELECT * FROM signs WHERE id = $1', [id]);

      if (sign.rows.length === 0) {
        res.status(404).json({
          success: false,
          message: 'Sign not found',
        });
        return;
      }

      const signData = sign.rows[0];

      // Delete files from R2
      if (signData.image_url) {
        await StorageService.deleteFile(signData.image_url).catch(console.error);
      }

      if (signData.video_url) {
        await StorageService.deleteFile(signData.video_url).catch(console.error);
      }

      // Delete from database
      await pool.query('DELETE FROM signs WHERE id = $1', [id]);

      res.status(200).json({
        success: true,
        message: 'Sign deleted successfully',
      });
    } catch (error) {
      console.error('Error deleting sign:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to delete sign',
        error: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  /**
   * Delete category
   */
  static async deleteCategory(req: Request, res: Response): Promise<void> {
    try {
      const { id } = req.params;

      const category = await pool.query('SELECT * FROM categories WHERE id = $1', [id]);

      if (category.rows.length === 0) {
        res.status(404).json({
          success: false,
          message: 'Category not found',
        });
        return;
      }

      const categoryData = category.rows[0];

      if (categoryData.icon_url) {
        await StorageService.deleteFile(categoryData.icon_url).catch(console.error);
      }

      await pool.query('DELETE FROM categories WHERE id = $1', [id]);

      res.status(200).json({
        success: true,
        message: 'Category deleted successfully',
      });
    } catch (error) {
      console.error('Error deleting category:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to delete category',
        error: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  /**
   * Get exercises with complete details for Android app
   * Returns exercises with all options in JSON format
   */
  static async getExercises(req: Request, res: Response): Promise<void> {
    try {
      const { category_id, exercise_id } = req.query;

      let query = `
        SELECT 
          e.id,
          e.category_id,
          e.type,
          e.prompt as question,
          e.correct_sign_id,
          c.name as category_name,
          json_build_object(
            'id', correct_sign.id,
            'name', correct_sign.name,
            'description', correct_sign.description,
            'image_url', correct_sign.image_url,
            'video_url', correct_sign.video_url
          ) as correct_sign,
          (
            SELECT json_agg(json_build_object(
              'id', id,
              'name', name,
              'description', description,
              'image_url', image_url,
              'video_url', video_url,
              'is_correct', is_correct
            ))
            FROM (
              SELECT 
                s.id,
                s.name,
                s.description,
                s.image_url,
                s.video_url,
                true as is_correct
              FROM signs s
              WHERE s.id = e.correct_sign_id
              
              UNION ALL
              
              SELECT 
                id,
                name,
                description,
                image_url,
                video_url,
                false as is_correct
              FROM (
                SELECT 
                  s.id,
                  s.name,
                  s.description,
                  s.image_url,
                  s.video_url
                FROM signs s
                WHERE s.id <> e.correct_sign_id 
                  AND s.category_id = e.category_id
                ORDER BY RANDOM()
                LIMIT 3
              ) AS random_incorrect
            ) AS all_options
          ) as options
        FROM exercises e
        LEFT JOIN categories c ON e.category_id = c.id
        LEFT JOIN signs correct_sign ON e.correct_sign_id = correct_sign.id
      `;

      const params: any[] = [];

      if (exercise_id) {
        query += ` WHERE e.id = $1`;
        params.push(exercise_id);
      } else if (category_id) {
        query += ` WHERE e.category_id = $1`;
        params.push(category_id);
      }

      query += ` ORDER BY e.id`;

      const result = await pool.query(query, params);

      if (exercise_id && result.rows.length === 0) {
        res.status(404).json({
          success: false,
          message: 'Exercise not found',
        });
        return;
      }

      res.status(200).json({
        success: true,
        count: result.rows.length,
        data: exercise_id ? result.rows[0] : result.rows,
      });
    } catch (error) {
      console.error('Error fetching exercises:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to fetch exercises',
        error: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  /**
   * Delete exercise
   */
  static async deleteExercise(req: Request, res: Response): Promise<void> {
    try {
      const { id } = req.params;

      const exercise = await pool.query('SELECT * FROM exercises WHERE id = $1', [id]);

      if (exercise.rows.length === 0) {
        res.status(404).json({
          success: false,
          message: 'Exercise not found',
        });
        return;
      }

      // Delete exercise (options will be cascade deleted due to foreign key)
      await pool.query('DELETE FROM exercises WHERE id = $1', [id]);

      res.status(200).json({
        success: true,
        message: 'Exercise deleted successfully',
      });
    } catch (error) {
      console.error('Error deleting exercise:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to delete exercise',
        error: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }

  /**
   * Update user avatar
   */
  static async updateAvatar(req: Request, res: Response): Promise<void> {
    try {
      const { userId } = req.params;
      const file = req.file;

      if (!file) {
        res.status(400).json({
          success: false,
          message: 'No file provided',
        });
        return;
      }

      // Get current user
      const user = await pool.query('SELECT * FROM users WHERE id = $1', [userId]);

      if (user.rows.length === 0) {
        res.status(404).json({
          success: false,
          message: 'User not found',
        });
        return;
      }

      const currentUser = user.rows[0];

      // Delete old avatar if exists
      if (currentUser.avatar_url) {
        await StorageService.deleteFile(currentUser.avatar_url).catch(console.error);
      }

      // Upload new avatar
      const avatarUrl = await StorageService.uploadFile(file, {
        folder: StorageService.getFolderPath('avatars'),
        optimize: true,
        maxWidth: 512,
        quality: 90,
      });

      // Update database
      const query = `
        UPDATE users 
        SET avatar_url = $1
        WHERE id = $2
        RETURNING id, display_name, email, avatar_url
      `;

      const result = await pool.query(query, [avatarUrl, userId]);

      res.status(200).json({
        success: true,
        message: 'Avatar updated successfully',
        data: result.rows[0],
      });
    } catch (error) {
      console.error('Error updating avatar:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to update avatar',
        error: error instanceof Error ? error.message : 'Unknown error',
      });
    }
  }
}

// Export as individual functions for backwards compatibility
export const getAllItems = ItemController.getAllItems;
export const getItemById = ItemController.getItemById;
export const createItem = ItemController.createSign; // Maps to createSign
export const updateItem = ItemController.updateSign; // Maps to updateSign
export const deleteItem = ItemController.deleteSign; // Maps to deleteSign