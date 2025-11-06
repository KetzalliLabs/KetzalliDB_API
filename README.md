# KetzalliDB API

A CRUD Express API built with TypeScript and Node.js using TSX for development.

## Features

- ✅ Express.js REST API
- ✅ TypeScript for type safety
- ✅ TSX for fast development with hot reload
- ✅ CRUD operations for Items resource
- ✅ Error handling middleware
- ✅ CORS enabled
- ✅ Environment variables support
- ✅ In-memory data storage (easily replaceable with a real database)

## Prerequisites

- Node.js (v18 or higher)
- npm or yarn

## Installation

1. Install dependencies:
```bash
npm install
```

2. Create environment file:
```bash
copy .env.example .env
```

3. Configure your environment variables in `.env`:
```
PORT=3000
NODE_ENV=development
```

## Development

Run the development server with hot reload:
```bash
npm run dev
```

The API will be available at `http://localhost:3000`

## Build

Compile TypeScript to JavaScript:
```bash
npm run build
```

## Production

Run the compiled version:
```bash
npm start
```

## API Endpoints

### Health Check
- **GET** `/` - Check API status

### Items CRUD

- **GET** `/api/items` - Get all items
- **GET** `/api/items/:id` - Get item by ID
- **POST** `/api/items` - Create new item
- **PUT** `/api/items/:id` - Update item
- **DELETE** `/api/items/:id` - Delete item

## Request Examples

### Create Item
```bash
POST http://localhost:3000/api/items
Content-Type: application/json

{
  "name": "Sample Item",
  "description": "This is a sample item"
}
```

### Get All Items
```bash
GET http://localhost:3000/api/items
```

### Get Item by ID
```bash
GET http://localhost:3000/api/items/1234567890
```

### Update Item
```bash
PUT http://localhost:3000/api/items/1234567890
Content-Type: application/json

{
  "name": "Updated Item",
  "description": "Updated description"
}
```

### Delete Item
```bash
DELETE http://localhost:3000/api/items/1234567890
```

## Response Format

All responses follow this format:

### Success Response
```json
{
  "success": true,
  "data": { /* response data */ },
  "message": "Optional success message"
}
```

### Error Response
```json
{
  "success": false,
  "message": "Error message"
}
```

## Project Structure

```
API/
├── src/
│   ├── controllers/       # Request handlers
│   │   └── item.controller.ts
│   ├── middleware/        # Express middleware
│   │   └── error.middleware.ts
│   ├── models/           # TypeScript interfaces
│   │   └── item.model.ts
│   ├── routes/           # API routes
│   │   └── item.routes.ts
│   └── index.ts          # Application entry point
├── dist/                 # Compiled JavaScript (generated)
├── .env                  # Environment variables
├── .env.example          # Environment template
├── .gitignore           # Git ignore rules
├── package.json         # Dependencies and scripts
├── tsconfig.json        # TypeScript configuration
└── README.md            # This file
```

## Technologies Used

- **Express.js** - Web framework
- **TypeScript** - Type-safe JavaScript
- **TSX** - TypeScript execution with hot reload
- **CORS** - Cross-Origin Resource Sharing
- **dotenv** - Environment variables management

## Next Steps

- Add database integration (MongoDB, PostgreSQL, etc.)
- Implement authentication and authorization
- Add input validation (e.g., using Zod or Joi)
- Add request logging
- Add unit and integration tests
- Add API documentation (Swagger/OpenAPI)
- Implement pagination and filtering

## License

ISC
