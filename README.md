# KetzalliDB API

> A RESTful API for Amoxcalli - Mexican Sign Language Learning Platform

## ✅ Project Status

**COMPLETED** - Version 1.0.0 (December 3, 2025)

This project is officially complete and production-ready. All core features, authentication, gamification systems, and API endpoints are fully implemented and tested.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Database Setup](#database-setup)
- [Running the Application](#running-the-application)
- [API Endpoints](#api-endpoints)
- [Authentication](#authentication)
- [Admin Management](#admin-management)
- [File Upload](#file-upload)
- [Error Handling](#error-handling)
- [Project Structure](#project-structure)
- [Development](#development)
- [License](#license)

## 🌟 Overview

KetzalliDB API is a production-ready TypeScript-based Express.js backend service designed for the Amoxcalli Mexican Sign Language learning platform. It provides comprehensive CRUD operations for managing signs, categories, exercises, user profiles, and gamification features including streaks, medals, and progress tracking.

**Version**: 1.0.0  
**Status**: Production Ready  
**Completion Date**: December 3, 2025

## ✨ Features

- 🔐 **Firebase Authentication** - Secure user authentication with Firebase Admin SDK
- 🗄️ **PostgreSQL Database** - Robust relational database for data persistence
- ☁️ **Cloudflare R2 Storage** - S3-compatible cloud storage for media files
- 🖼️ **Image Processing** - Automatic image optimization with Sharp
- 📁 **Multi-part File Uploads** - Support for images and videos
- 🎯 **Role-based Access Control** - Admin and user roles
- 🏆 **Gamification System**:
  - Daily streaks tracking
  - Achievement medals with conditions
  - User progress tracking by category
  - Exercise completion history
  - Sign view analytics
  - User statistics (EXP, coins, accuracy)
- ⭐ **Favorites System** - Users can save favorite signs
- 📊 **Quiz Generation** - Dynamic quiz creation with 3 modes (category, mixed, custom)
- 🔍 **Type Safety** - Full TypeScript support
- 🛡️ **Error Handling** - Centralized error handling middleware
- 📊 **Health Monitoring** - Built-in health check endpoints

## 🛠️ Tech Stack

- **Runtime**: Node.js
- **Framework**: Express.js
- **Language**: TypeScript
- **Database**: PostgreSQL
- **Authentication**: Firebase Admin SDK
- **Storage**: Cloudflare R2 (S3-compatible)
- **Image Processing**: Sharp
- **File Upload**: Multer
- **Development**: tsx (TypeScript execution)

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- Node.js (v18 or higher)
- PostgreSQL (v12 or higher)
- npm or yarn
- Firebase project with service account
- Cloudflare R2 account (or S3-compatible storage)

## 🚀 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/KetzalliLabs/KetzalliDB_API.git
   cd KetzalliDB_API
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up Firebase service account**
   - Download your Firebase service account JSON file
   - Save it as `serviceAccount.json` in the project root

## ⚙️ Configuration

Create a `.env` file in the project root with the following variables:

```env
# Server Configuration
PORT=3000
NODE_ENV=development

# Database Configuration
DB_HOST=localhost
DB_PORT=5432
DB_USER=your_db_user
DB_PASSWORD=your_db_password
DB_NAME=amoxcalli_db

# Firebase Configuration
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_PRIVATE_KEY=your-private-key
FIREBASE_CLIENT_EMAIL=your-client-email

# Cloudflare R2 Configuration
R2_ACCOUNT_ID=your_account_id
R2_ACCESS_KEY_ID=your_access_key_id
R2_SECRET_ACCESS_KEY=your_secret_access_key
R2_BUCKET_NAME=your_bucket_name
R2_PUBLIC_URL=https://your-public-url.r2.dev
```

## 🗄️ Database Setup

1. **Create the database**
   ```bash
   createdb amoxcalli_db
   ```

2. **Run the SQL schema**
   ```bash
   psql -d amoxcalli_db -f Database/Amoxcalli_DB.sql
   ```

3. **Create first admin user**
   ```bash
   npm run admin:create
   ```

## 🏃 Running the Application

### Development Mode
```bash
npm run dev
```

### Production Mode
```bash
npm run build
npm start
```

### Clean Build
```bash
npm run clean
npm run build
```

## 📚 API Endpoints

### Health & Info

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/` | API welcome message | No |
| GET | `/api` | API documentation | No |
| GET | `/api/health` | Health check with service status | No |

### Authentication

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/auth/register` | Register new user in DB | No |
| POST | `/api/auth/login` | Login user (auto-creates if doesn't exist) | No |
| GET | `/api/auth/me` | Get current user profile with stats | Yes |
| GET | `/api/auth/me/stats` | Get user statistics and progress | Yes |
| POST | `/api/auth/verify` | Verify Firebase token | Yes |
| POST | `/api/auth/users` | Create new user (admin) | Yes (Admin) |
| POST | `/api/auth/users/claims` | Set user custom claims (admin) | Yes (Admin) |
| DELETE | `/api/auth/users/:uid` | Delete user (admin) | Yes (Admin) |

### User Activity Tracking

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/auth/me/signs/:signId/view` | Record sign view | Yes |
| POST | `/api/auth/me/exercises/:exerciseId/complete` | Record exercise completion | Yes |
| POST | `/api/auth/me/daily-quiz` | Record daily quiz result | Yes |

### Favorites

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/auth/me/favorites/:signId` | Add sign to favorites | Yes |
| DELETE | `/api/auth/me/favorites/:signId` | Remove sign from favorites | Yes |
| GET | `/api/auth/me/favorites` | Get user's favorite signs | Yes |

### Medals & Achievements

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/auth/medals` | Get all available medals | No |
| GET | `/api/auth/me/medals` | Get user's earned medals | Yes |
| POST | `/api/auth/me/medals/:medalId/claim` | Claim a medal | Yes |
| POST | `/api/auth/users/:uid/medals/:medalId` | Award medal to user (admin) | Yes (Admin) |
| GET | `/api/items/medals/:slug` | Get medal by slug (public) | No |

### Items (Signs & Categories)

#### Public Endpoints (Read-only)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/items` | Get all items (supports type & category_id query params) | No |
| GET | `/api/items/:id` | Get item by ID (supports type query param) | No |

**Query Parameters:**
- `type`: `signs`, `categories`, `exercises`
- `category_id`: Filter items by category UUID

#### Protected Endpoints (Authentication Required)

##### Signs

| Method | Endpoint | Description | Content-Type |
|--------|----------|-------------|--------------|
| POST | `/api/items/signs` | Create new sign | `multipart/form-data` |
| PUT | `/api/items/signs/:id` | Update sign | `multipart/form-data` |
| DELETE | `/api/items/signs/:id` | Delete sign | - |

**Sign Form Data:**
- `name` (string): Sign name
- `description` (string): Sign description
- `category_id` (uuid): Category UUID
- `image` (file): Sign image (optional)
- `video` (file): Sign video (optional)

##### Categories

| Method | Endpoint | Description | Content-Type |
|--------|----------|-------------|--------------|
| POST | `/api/items/categories` | Create new category | `multipart/form-data` |
| PUT | `/api/items/categories/:id` | Update category | `multipart/form-data` |
| DELETE | `/api/items/categories/:id` | Delete category | - |

**Category Form Data:**
- `name` (string): Category name
- `description` (string): Category description
- `file` (file): Category icon image (optional)

##### Exercises

| Method | Endpoint | Description | Content-Type |
|--------|----------|-------------|--------------|
| GET | `/api/items/exercises` | Get exercises with options | - |
| GET | `/api/items/exercises/:id/quiz` | Get exercise as quiz (1 correct + 3 incorrect) | - |
| POST | `/api/items/exercises/generate-quiz` | Generate quiz with multiple exercises | `application/json` |
| POST | `/api/items/exercises` | Create new exercise | `application/json` |
| DELETE | `/api/items/exercises/:id` | Delete exercise | - |

**Get Exercises Query Parameters:**
- `category_id` (uuid): Filter by category
- `exercise_id` (uuid): Get specific exercise

**Exercise JSON Body:**
```json
{
  "category_id": "uuid",
  "type": "multiple_choice",
  "prompt": "What is this sign?",
  "order_num": 1,
  "options": [
    {
      "text": "Option 1",
      "image_url": "https://...",
      "video_url": "https://...",
      "is_correct": true
    }
  ]
}
```

**Generate Quiz JSON Body:**
```json
{
  "mode": "category",
  "count": 10,
  "category_id": "uuid"
}
```

**Quiz Modes:**
- `category` - Questions from specific category (requires `category_id`)
- `mixed` - Random questions from all categories
- `custom` - Specific exercises (requires `exercise_ids` array)

##### User Avatar

| Method | Endpoint | Description | Content-Type |
|--------|----------|-------------|--------------|
| PUT | `/api/items/users/:userId/avatar` | Update user avatar | `multipart/form-data` |

**Avatar Form Data:**
- `file` (file): Avatar image

## 🔐 Authentication

This API uses Firebase Authentication. To access protected endpoints:

1. **Obtain a Firebase ID token** from your client application
2. **Include the token** in the Authorization header:
   ```
   Authorization: Bearer YOUR_FIREBASE_ID_TOKEN
   ```

### Example Request

```bash
curl -X GET http://localhost:3000/api/auth/me \
  -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9..."
```

## 👑 Admin Management

The API includes built-in scripts for managing admin users:

### Create First Admin
```bash
npm run admin:create
```
Creates the first admin user in the database and sets Firebase custom claims.

### Set Admin Role
```bash
npm run admin:set
```
Grant admin privileges to a user by Firebase UID.

### Remove Admin Role
```bash
npm run admin:remove
```
Revoke admin privileges from a user.

### List All Admins
```bash
npm run admin:list
```
Display all users with admin role.

## 📤 File Upload

The API supports file uploads for:
- **Sign images** (PNG, JPEG, WebP)
- **Sign videos** (MP4, WebM)
- **Category icons** (PNG, JPEG, WebP)
- **User avatars** (PNG, JPEG, WebP)

### Upload Specifications

- **Max file size**: 10MB (images), 50MB (videos)
- **Accepted formats**:
  - Images: PNG, JPEG, JPG, WebP, GIF
  - Videos: MP4, WebM, AVI, MOV
- **Image processing**: Automatic optimization and resizing
- **Storage**: Cloudflare R2 with public URLs

### Example Upload (cURL)

```bash
curl -X POST http://localhost:3000/api/items/signs \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -F "name=Hello" \
  -F "description=Sign for greeting" \
  -F "category_id=550e8400-e29b-41d4-a716-446655440000" \
  -F "image=@/path/to/image.jpg" \
  -F "video=@/path/to/video.mp4"
```

## ⚠️ Error Handling

The API uses centralized error handling with consistent response formats:

### Success Response
```json
{
  "success": true,
  "data": { ... }
}
```

### Error Response
```json
{
  "success": false,
  "error": "Error message",
  "details": "Detailed error information"
}
```

### HTTP Status Codes

- `200` - Success
- `201` - Created
- `400` - Bad Request
- `401` - Unauthorized
- `403` - Forbidden
- `404` - Not Found
- `500` - Internal Server Error

## 📁 Project Structure

```
KetzalliDB_API/
├── src/
│   ├── config/           # Configuration files
│   │   ├── database.ts
│   │   ├── firebase.config.ts
│   │   └── r2.config.ts
│   ├── controllers/      # Route controllers
│   │   ├── auth.controller.ts
│   │   └── item.controller.ts
│   ├── middleware/       # Express middleware
│   │   ├── auth.middleware.ts
│   │   ├── error.middleware.ts
│   │   ├── src.middleware.ts
│   │   └── upload.middleware.ts
│   ├── models/          # Data models
│   │   └── item.model.ts
│   ├── routes/          # API routes
│   │   ├── auth.routes.ts
│   │   └── item.routes.ts
│   ├── scripts/         # Utility scripts
│   │   └── createFirstAdmin.ts
│   ├── types/           # TypeScript type definitions
│   │   └── express.d.ts
│   ├── utils/           # Helper utilities
│   │   ├── setAdmin.ts
│   │   └── storage.util.ts
│   └── index.ts         # Application entry point
├── Database/
│   └── Amoxcalli_DB.sql # Database schema
├── .env                 # Environment variables (not in repo)
├── package.json
├── tsconfig.json
└── serviceAccount.json  # Firebase credentials (not in repo)
```

## 🔧 Development

### Code Style

This project uses TypeScript with strict type checking enabled. Follow these guidelines:

- Use TypeScript for all new files
- Define interfaces for all data structures
- Handle errors explicitly
- Use async/await for asynchronous operations
- Follow RESTful API conventions

### Available Scripts

| Command | Description |
|---------|-------------|
| `npm run dev` | Start development server with hot reload |
| `npm run build` | Compile TypeScript to JavaScript |
| `npm start` | Run production server |
| `npm run clean` | Remove build directory |
| `npm run admin:create` | Create first admin user |
| `npm run admin:set` | Grant admin privileges |
| `npm run admin:remove` | Revoke admin privileges |
| `npm run admin:list` | List all admins |

### Database Schema

The database includes the following tables:
- **roles** - User role definitions
- **users** - User profiles and authentication
- **categories** - Sign categories
- **signs** - Mexican Sign Language signs
- **exercises** - Learning exercises
- **exercise_options** - Exercise answer options
- **attempts** - User exercise attempts
- **progress** - User learning progress by category
- **streaks** - Daily streak tracking
- **medals** - Achievement medal definitions
- **medal_conditions** - Medal unlock conditions
- **user_medals** - User medal achievements
- **stats** - Global stat definitions (EXP, coins, etc.)
- **user_stats** - User statistics values
- **daily_quiz_history** - Daily quiz completion records
- **user_exercise_history** - Exercise completion timestamps
- **user_sign_views** - Sign view tracking
- **user_favorite_signs** - User favorite signs

## 📄 License

ISC

---

## 🎉 Project Completion

This project was successfully completed on **December 3, 2025** as part of the Software Development Security course at Tecnológico de Monterrey.

### ✨ Achievements

- ✅ Full REST API implementation with TypeScript
- ✅ Firebase authentication and role-based access control
- ✅ PostgreSQL database with 17 normalized tables
- ✅ Cloudflare R2 media storage integration
- ✅ Complete gamification system (streaks, medals, progress tracking)
- ✅ Dynamic quiz generation with 3 modes
- ✅ User activity tracking and analytics
- ✅ Comprehensive API documentation
- ✅ Production-ready error handling
- ✅ Admin management tools
- ✅ Spanish landing page and documentation website
- ✅ Student performance report template

### 🙏 Acknowledgments

Special thanks to the Software Development Security course instructors and the KetzalliLabs team for their support throughout this project.

---

Made with ❤️ by KetzalliLabs
