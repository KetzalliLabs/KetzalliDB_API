import { PutObjectCommand, DeleteObjectCommand, HeadObjectCommand } from '@aws-sdk/client-s3';
import { r2Client, R2_CONFIG } from '../config/r2.config';
import sharp from 'sharp';
import { v4 as uuidv4 } from 'uuid';

export interface UploadOptions {
  folder?: string;
  optimize?: boolean;
  maxWidth?: number;
  quality?: number;
}

export class StorageService {
  /**
   * Upload a file to R2 storage
   * @param file - Multer file object
   * @param options - Upload options
   * @returns Public URL of the uploaded file
   */
  static async uploadFile(
    file: Express.Multer.File,
    options: UploadOptions = {}
  ): Promise<string> {
    try {
      const {
        folder = 'uploads',
        optimize = true,
        maxWidth = 1920,
        quality = 85,
      } = options;

      // Generate unique filename
      const fileExtension = file.originalname.split('.').pop();
      const fileName = `${uuidv4()}.${fileExtension}`;
      const key = `${folder}/${fileName}`;

      let fileBuffer = file.buffer;
      let contentType = file.mimetype;

      // Optimize image if it's an image file
      if (optimize && file.mimetype.startsWith('image/')) {
        fileBuffer = await sharp(file.buffer)
          .resize(maxWidth, null, {
            withoutEnlargement: true,
            fit: 'inside',
          })
          .jpeg({ quality, progressive: true })
          .toBuffer();

        contentType = 'image/jpeg';
      }

      // Upload to R2
      const command = new PutObjectCommand({
        Bucket: R2_CONFIG.bucketName,
        Key: key,
        Body: fileBuffer,
        ContentType: contentType,
      });

      await r2Client.send(command);

      // Return public URL
      const publicUrl = `${R2_CONFIG.publicUrl}/${key}`;
      return publicUrl;
    } catch (error) {
      console.error('Error uploading file to R2:', error);
      throw new Error('Failed to upload file to storage');
    }
  }

  /**
   * Upload multiple files
   * @param files - Array of Multer file objects
   * @param options - Upload options
   * @returns Array of public URLs
   */
  static async uploadMultipleFiles(
    files: Express.Multer.File[],
    options: UploadOptions = {}
  ): Promise<string[]> {
    const uploadPromises = files.map((file) => this.uploadFile(file, options));
    return Promise.all(uploadPromises);
  }

  /**
   * Delete a file from R2 storage
   * @param fileUrl - Full public URL of the file
   * @returns Boolean indicating success
   */
  static async deleteFile(fileUrl: string): Promise<boolean> {
    try {
      // Extract key from public URL
      const key = fileUrl.replace(`${R2_CONFIG.publicUrl}/`, '');

      const command = new DeleteObjectCommand({
        Bucket: R2_CONFIG.bucketName,
        Key: key,
      });

      await r2Client.send(command);
      return true;
    } catch (error) {
      console.error('Error deleting file from R2:', error);
      throw new Error('Failed to delete file from storage');
    }
  }

  /**
   * Check if a file exists in R2
   * @param fileUrl - Full public URL of the file
   * @returns Boolean indicating if file exists
   */
  static async fileExists(fileUrl: string): Promise<boolean> {
    try {
      const key = fileUrl.replace(`${R2_CONFIG.publicUrl}/`, '');

      const command = new HeadObjectCommand({
        Bucket: R2_CONFIG.bucketName,
        Key: key,
      });

      await r2Client.send(command);
      return true;
    } catch (error) {
      return false;
    }
  }

  /**
   * Get folder path for different asset types
   */
  static getFolderPath(type: 'signs' | 'avatars' | 'medals' | 'categories' | 'exercises'): string {
    const folderMap = {
      signs: 'signs',
      avatars: 'avatars',
      medals: 'medals',
      categories: 'categories',
      exercises: 'exercises',
    };
    return folderMap[type] || 'uploads';
  }
}