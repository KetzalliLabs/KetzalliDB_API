import multer from 'multer';
import path from 'path';
import { Request } from 'express';

/**
 * Multer configuration for file uploads
 * Files are stored in memory for processing before uploading to R2
 */

// File filter to accept only images and videos
const fileFilter = (req: Request, file: Express.Multer.File, cb: multer.FileFilterCallback) => {
  // Allowed image types
  const imageTypes = /jpeg|jpg|png|gif|webp/;
  // Allowed video types
  const videoTypes = /mp4|avi|mov|wmv|flv|webm/;

  const extname = path.extname(file.originalname).toLowerCase();
  const mimetype = file.mimetype;

  // Check if file is an image
  if (mimetype.startsWith('image/') && imageTypes.test(extname.slice(1))) {
    cb(null, true);
    return;
  }

  // Check if file is a video
  if (mimetype.startsWith('video/') && videoTypes.test(extname.slice(1))) {
    cb(null, true);
    return;
  }

  // Reject file
  cb(new Error(`Invalid file type. Only images (${imageTypes.source}) and videos (${videoTypes.source}) are allowed.`));
};

// Multer configuration - store files in memory
const storage = multer.memoryStorage();

// Single file upload middleware
export const upload = multer({
  storage,
  fileFilter,
  limits: {
    fileSize: 100 * 1024 * 1024, // 100MB max file size
  },
});

// Multiple fields upload middleware for signs (image + video)
export const uploadFields = upload.fields([
  { name: 'image', maxCount: 1 },
  { name: 'video', maxCount: 1 },
]);

// Single image upload
export const uploadImage = upload.single('image');

// Single video upload
export const uploadVideo = upload.single('video');

// Avatar upload
export const uploadAvatar = upload.single('avatar');
