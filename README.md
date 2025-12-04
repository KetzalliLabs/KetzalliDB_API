# KetzalliDB API

> API RESTful para Amoxcalli - Plataforma de Aprendizaje de Lengua de Señas Mexicana

## Estado del Proyecto

**COMPLETADO** - Versión 1.0.0 (3 de Diciembre, 2025)

Este proyecto está oficialmente completo y listo para producción. Todas las características principales, autenticación, sistemas de gamificación y endpoints de la API están completamente implementados y probados.

## Tabla de Contenidos

- [Descripción General](#descripción-general)
- [Características](#características)
- [Stack Tecnológico](#stack-tecnológico)
- [Prerequisitos](#prerequisitos)
- [Instalación](#instalación)
- [Configuración](#configuración)
- [Configuración de la Base de Datos](#configuración-de-la-base-de-datos)
- [Ejecutar la Aplicación](#ejecutar-la-aplicación)
- [Endpoints de la API](#endpoints-de-la-api)
- [Autenticación](#autenticación)
- [Gestión de Administradores](#gestión-de-administradores)
- [Carga de Archivos](#carga-de-archivos)
- [Manejo de Errores](#manejo-de-errores)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Desarrollo](#desarrollo)
- [Licencia](#licencia)

## Descripción General

KetzalliDB API es un servicio backend basado en Express.js y TypeScript listo para producción, diseñado para la plataforma de aprendizaje de Lengua de Señas Mexicana Amoxcalli. Proporciona operaciones CRUD completas para gestionar señas, categorías, ejercicios, perfiles de usuario y características de gamificación incluyendo rachas, medallas y seguimiento de progreso.

**Versión**: 1.0.0  
**Estado**: Listo para Producción  
**Fecha de Finalización**: 3 de Diciembre, 2025

## Características

- **Autenticación Firebase** - Autenticación segura de usuarios con Firebase Admin SDK
- **Base de Datos PostgreSQL** - Base de datos relacional robusta para persistencia de datos
- **Almacenamiento Cloudflare R2** - Almacenamiento en la nube compatible con S3 para archivos multimedia
- **Procesamiento de Imágenes** - Optimización automática de imágenes con Sharp
- **Carga de Archivos Multi-parte** - Soporte para imágenes y videos
- **Control de Acceso Basado en Roles** - Roles de administrador y usuario
- **Sistema de Gamificación**:
  - Seguimiento de rachas diarias
  - Medallas de logros con condiciones
  - Seguimiento de progreso del usuario por categoría
  - Historial de finalización de ejercicios
  - Análisis de visualización de señas
  - Estadísticas de usuario (EXP, monedas, precisión)
- **Sistema de Favoritos** - Los usuarios pueden guardar señas favoritas
- **Generación de Quizzes** - Creación dinámica de quizzes con 3 modos (categoría, mixto, personalizado)
- **Seguridad de Tipos** - Soporte completo de TypeScript
- **Manejo de Errores** - Middleware centralizado de manejo de errores
- **Monitoreo de Salud** - Endpoints integrados de verificación de salud

## Stack Tecnológico

- **Runtime**: Node.js
- **Framework**: Express.js
- **Lenguaje**: TypeScript
- **Base de Datos**: PostgreSQL
- **Autenticación**: Firebase Admin SDK
- **Almacenamiento**: Cloudflare R2 (compatible con S3)
- **Procesamiento de Imágenes**: Sharp
- **Carga de Archivos**: Multer
- **Desarrollo**: tsx (ejecución de TypeScript)

## Prerequisitos

Antes de comenzar, asegúrate de tener lo siguiente instalado:

- Node.js (v18 o superior)
- PostgreSQL (v12 o superior)
- npm o yarn
- Proyecto Firebase con cuenta de servicio
- Cuenta Cloudflare R2 (o almacenamiento compatible con S3)

## Instalación

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/KetzalliLabs/KetzalliDB_API.git
   cd KetzalliDB_API
   ```

2. **Instalar dependencias**
   ```bash
   npm install
   ```

3. **Configurar cuenta de servicio de Firebase**
   - Descarga tu archivo JSON de cuenta de servicio de Firebase
   - Guárdalo como `serviceAccount.json` en la raíz del proyecto

## Configuración

Crea un archivo `.env` en la raíz del proyecto con las siguientes variables:

```env
# Configuración del Servidor
PORT=3000
NODE_ENV=development

# Configuración de Base de Datos
DB_HOST=localhost
DB_PORT=5432
DB_USER=your_db_user
DB_PASSWORD=your_db_password
DB_NAME=amoxcalli_db

# Configuración de Firebase
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_PRIVATE_KEY=your-private-key
FIREBASE_CLIENT_EMAIL=your-client-email

# Configuración de Cloudflare R2
R2_ACCOUNT_ID=your_account_id
R2_ACCESS_KEY_ID=your_access_key_id
R2_SECRET_ACCESS_KEY=your_secret_access_key
R2_BUCKET_NAME=your_bucket_name
R2_PUBLIC_URL=https://your-public-url.r2.dev
```

## Configuración de la Base de Datos

1. **Crear la base de datos**
   ```bash
   createdb amoxcalli_db
   ```

2. **Ejecutar el esquema SQL**
   ```bash
   psql -d amoxcalli_db -f Database/Amoxcalli_DB.sql
   ```

3. **Crear primer usuario administrador**
   ```bash
   npm run admin:create
   ```

## Ejecutar la Aplicación

### Modo Desarrollo
```bash
npm run dev
```

### Modo Producción
```bash
npm run build
npm start
```

### Build Limpio
```bash
npm run clean
npm run build
```

## Endpoints de la API

### Salud e Información

| Método | Endpoint | Descripción | Autenticación Requerida |
|--------|----------|-------------|-------------------------|
| GET | `/` | Mensaje de bienvenida de la API | No |
| GET | `/api` | Documentación de la API | No |
| GET | `/api/health` | Verificación de salud con estado de servicios | No |

### Autenticación

| Método | Endpoint | Descripción | Autenticación Requerida |
|--------|----------|-------------|-------------------------|
| POST | `/api/auth/register` | Registrar nuevo usuario en BD | No |
| POST | `/api/auth/login` | Iniciar sesión de usuario (auto-crea si no existe) | No |
| GET | `/api/auth/me` | Obtener perfil de usuario actual con estadísticas | Sí |
| GET | `/api/auth/me/stats` | Obtener estadísticas y progreso del usuario | Sí |
| POST | `/api/auth/verify` | Verificar token de Firebase | Sí |
| POST | `/api/auth/users` | Crear nuevo usuario (admin) | Sí (Admin) |
| POST | `/api/auth/users/claims` | Establecer claims personalizados de usuario (admin) | Sí (Admin) |
| DELETE | `/api/auth/users/:uid` | Eliminar usuario (admin) | Sí (Admin) |

### Seguimiento de Actividad del Usuario

| Método | Endpoint | Descripción | Autenticación Requerida |
|--------|----------|-------------|-------------------------|
| POST | `/api/auth/me/signs/:signId/view` | Registrar visualización de seña | Sí |
| POST | `/api/auth/me/exercises/:exerciseId/complete` | Registrar finalización de ejercicio | Sí |
| POST | `/api/auth/me/daily-quiz` | Registrar resultado de quiz diario | Sí |

### Favoritos

| Método | Endpoint | Descripción | Autenticación Requerida |
|--------|----------|-------------|-------------------------|
| POST | `/api/auth/me/favorites/:signId` | Agregar seña a favoritos | Sí |
| DELETE | `/api/auth/me/favorites/:signId` | Eliminar seña de favoritos | Sí |
| GET | `/api/auth/me/favorites` | Obtener señas favoritas del usuario | Sí |

### Medallas y Logros

| Método | Endpoint | Descripción | Autenticación Requerida |
|--------|----------|-------------|-------------------------|
| GET | `/api/auth/medals` | Obtener todas las medallas disponibles | No |
| GET | `/api/auth/me/medals` | Obtener medallas ganadas del usuario | Sí |
| POST | `/api/auth/me/medals/:medalId/claim` | Reclamar una medalla | Sí |
| POST | `/api/auth/users/:uid/medals/:medalId` | Otorgar medalla a usuario (admin) | Sí (Admin) |
| GET | `/api/items/medals/:slug` | Obtener medalla por slug (público) | No |

### Items (Señas y Categorías)

#### Endpoints Públicos (Solo lectura)

| Método | Endpoint | Descripción | Autenticación Requerida |
|--------|----------|-------------|-------------------------|
| GET | `/api/items` | Obtener todos los items (soporta parámetros type y category_id) | No |
| GET | `/api/items/:id` | Obtener item por ID (soporta parámetro type) | No |

**Parámetros de Consulta:**
- `type`: `signs`, `categories`, `exercises`
- `category_id`: Filtrar items por UUID de categoría

#### Endpoints Protegidos (Autenticación Requerida)

##### Señas

| Método | Endpoint | Descripción | Content-Type |
|--------|----------|-------------|--------------|
| POST | `/api/items/signs` | Crear nueva seña | `multipart/form-data` |
| PUT | `/api/items/signs/:id` | Actualizar seña | `multipart/form-data` |
| DELETE | `/api/items/signs/:id` | Eliminar seña | - |

**Datos de Formulario de Seña:**
- `name` (string): Nombre de la seña
- `description` (string): Descripción de la seña
- `category_id` (uuid): UUID de categoría
- `image` (file): Imagen de la seña (opcional)
- `video` (file): Video de la seña (opcional)

##### Categorías

| Método | Endpoint | Descripción | Content-Type |
|--------|----------|-------------|--------------|
| POST | `/api/items/categories` | Crear nueva categoría | `multipart/form-data` |
| PUT | `/api/items/categories/:id` | Actualizar categoría | `multipart/form-data` |
| DELETE | `/api/items/categories/:id` | Eliminar categoría | - |

**Datos de Formulario de Categoría:**
- `name` (string): Nombre de la categoría
- `description` (string): Descripción de la categoría
- `file` (file): Imagen de icono de categoría (opcional)

##### Ejercicios

| Método | Endpoint | Descripción | Content-Type |
|--------|----------|-------------|--------------|
| GET | `/api/items/exercises` | Obtener ejercicios con opciones | - |
| GET | `/api/items/exercises/:id/quiz` | Obtener ejercicio como quiz (1 correcta + 3 incorrectas) | - |
| POST | `/api/items/exercises/generate-quiz` | Generar quiz con múltiples ejercicios | `application/json` |
| POST | `/api/items/exercises` | Crear nuevo ejercicio | `application/json` |
| DELETE | `/api/items/exercises/:id` | Eliminar ejercicio | - |

**Parámetros de Consulta para Obtener Ejercicios:**
- `category_id` (uuid): Filtrar por categoría
- `exercise_id` (uuid): Obtener ejercicio específico

**Cuerpo JSON de Ejercicio:**
```json
{
  "category_id": "uuid",
  "type": "multiple_choice",
  "prompt": "¿Qué es esta seña?",
  "order_num": 1,
  "options": [
    {
      "text": "Opción 1",
      "image_url": "https://...",
      "video_url": "https://...",
      "is_correct": true
    }
  ]
}
```

**Cuerpo JSON para Generar Quiz:**
```json
{
  "mode": "category",
  "count": 10,
  "category_id": "uuid"
}
```

**Modos de Quiz:**
- `category` - Preguntas de categoría específica (requiere `category_id`)
- `mixed` - Preguntas aleatorias de todas las categorías
- `custom` - Ejercicios específicos (requiere array `exercise_ids`)

##### Avatar de Usuario

| Método | Endpoint | Descripción | Content-Type |
|--------|----------|-------------|--------------|
| PUT | `/api/items/users/:userId/avatar` | Actualizar avatar de usuario | `multipart/form-data` |

**Datos de Formulario de Avatar:**
- `file` (file): Imagen de avatar

## Autenticación

Esta API utiliza Firebase Authentication. Para acceder a endpoints protegidos:

1. **Obtén un token de ID de Firebase** desde tu aplicación cliente
2. **Incluye el token** en el encabezado de Autorización:
   ```
   Authorization: Bearer TU_TOKEN_DE_ID_DE_FIREBASE
   ```

### Ejemplo de Solicitud

```bash
curl -X GET http://localhost:3000/api/auth/me \
  -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9..."
```

## Gestión de Administradores

La API incluye scripts integrados para gestionar usuarios administradores:

### Crear Primer Administrador
```bash
npm run admin:create
```
Crea el primer usuario administrador en la base de datos y establece los claims personalizados de Firebase.

### Establecer Rol de Administrador
```bash
npm run admin:set
```
Otorgar privilegios de administrador a un usuario por UID de Firebase.

### Eliminar Rol de Administrador
```bash
npm run admin:remove
```
Revocar privilegios de administrador de un usuario.

### Listar Todos los Administradores
```bash
npm run admin:list
```
Mostrar todos los usuarios con rol de administrador.

## Carga de Archivos

La API soporta carga de archivos para:
- **Imágenes de señas** (PNG, JPEG, WebP)
- **Videos de señas** (MP4, WebM)
- **Iconos de categorías** (PNG, JPEG, WebP)
- **Avatares de usuario** (PNG, JPEG, WebP)

### Especificaciones de Carga

- **Tamaño máximo de archivo**: 10MB (imágenes), 50MB (videos)
- **Formatos aceptados**:
  - Imágenes: PNG, JPEG, JPG, WebP, GIF
  - Videos: MP4, WebM, AVI, MOV
- **Procesamiento de imágenes**: Optimización y redimensionamiento automático
- **Almacenamiento**: Cloudflare R2 con URLs públicas

### Ejemplo de Carga (cURL)

```bash
curl -X POST http://localhost:3000/api/items/signs \
  -H "Authorization: Bearer TU_TOKEN" \
  -F "name=Hola" \
  -F "description=Seña de saludo" \
  -F "category_id=550e8400-e29b-41d4-a716-446655440000" \
  -F "image=@/ruta/a/imagen.jpg" \
  -F "video=@/ruta/a/video.mp4"
```

## Manejo de Errores

La API utiliza manejo de errores centralizado con formatos de respuesta consistentes:

### Respuesta Exitosa
```json
{
  "success": true,
  "data": { ... }
}
```

### Respuesta de Error
```json
{
  "success": false,
  "error": "Mensaje de error",
  "details": "Información detallada del error"
}
```

### Códigos de Estado HTTP

- `200` - Éxito
- `201` - Creado
- `400` - Solicitud Incorrecta
- `401` - No Autorizado
- `403` - Prohibido
- `404` - No Encontrado
- `500` - Error Interno del Servidor

## Estructura del Proyecto

```
KetzalliDB_API/
├── src/
│   ├── config/           # Archivos de configuración
│   │   ├── database.ts
│   │   ├── firebase.config.ts
│   │   └── r2.config.ts
│   ├── controllers/      # Controladores de rutas
│   │   ├── auth.controller.ts
│   │   └── item.controller.ts
│   ├── middleware/       # Middleware de Express
│   │   ├── auth.middleware.ts
│   │   ├── error.middleware.ts
│   │   ├── src.middleware.ts
│   │   └── upload.middleware.ts
│   ├── models/          # Modelos de datos
│   │   └── item.model.ts
│   ├── routes/          # Rutas de la API
│   │   ├── auth.routes.ts
│   │   └── item.routes.ts
│   ├── scripts/         # Scripts de utilidad
│   │   └── createFirstAdmin.ts
│   ├── types/           # Definiciones de tipos TypeScript
│   │   └── express.d.ts
│   ├── utils/           # Utilidades auxiliares
│   │   ├── setAdmin.ts
│   │   └── storage.util.ts
│   └── index.ts         # Punto de entrada de la aplicación
├── Database/
│   └── Amoxcalli_DB.sql # Esquema de base de datos
├── .env                 # Variables de entorno (no en repo)
├── package.json
├── tsconfig.json
└── serviceAccount.json  # Credenciales de Firebase (no en repo)
```

## Desarrollo

### Estilo de Código

Este proyecto utiliza TypeScript con verificación de tipos estricta habilitada. Sigue estas directrices:

- Usa TypeScript para todos los archivos nuevos
- Define interfaces para todas las estructuras de datos
- Maneja errores explícitamente
- Usa async/await para operaciones asíncronas
- Sigue convenciones de API RESTful

### Scripts Disponibles

| Comando | Descripción |
|---------|-------------|
| `npm run dev` | Iniciar servidor de desarrollo con recarga en caliente |
| `npm run build` | Compilar TypeScript a JavaScript |
| `npm start` | Ejecutar servidor de producción |
| `npm run clean` | Eliminar directorio de build |
| `npm run admin:create` | Crear primer usuario administrador |
| `npm run admin:set` | Otorgar privilegios de administrador |
| `npm run admin:remove` | Revocar privilegios de administrador |
| `npm run admin:list` | Listar todos los administradores |

### Esquema de Base de Datos

La base de datos incluye las siguientes tablas:
- **roles** - Definiciones de roles de usuario
- **users** - Perfiles de usuario y autenticación
- **categories** - Categorías de señas
- **signs** - Señas de Lengua de Señas Mexicana
- **exercises** - Ejercicios de aprendizaje
- **exercise_options** - Opciones de respuesta de ejercicios
- **attempts** - Intentos de ejercicios de usuario
- **progress** - Progreso de aprendizaje de usuario por categoría
- **streaks** - Seguimiento de rachas diarias
- **medals** - Definiciones de medallas de logros
- **medal_conditions** - Condiciones de desbloqueo de medallas
- **user_medals** - Logros de medallas de usuario
- **stats** - Definiciones de estadísticas globales (EXP, monedas, etc.)
- **user_stats** - Valores de estadísticas de usuario
- **daily_quiz_history** - Registros de finalización de quizzes diarios
- **user_exercise_history** - Marcas de tiempo de finalización de ejercicios
- **user_sign_views** - Seguimiento de visualización de señas
- **user_favorite_signs** - Señas favoritas de usuario

## Licencia

ISC

---

## Finalización del Proyecto

Este proyecto fue completado exitosamente el **3 de Diciembre de 2025** como parte del curso de Seguridad en Desarrollo de Software en el Tecnológico de Monterrey.

### Logros

- Implementación completa de API REST con TypeScript
- Autenticación Firebase y control de acceso basado en roles
- Base de datos PostgreSQL con 17 tablas normalizadas
- Integración de almacenamiento multimedia Cloudflare R2
- Sistema de gamificación completo (rachas, medallas, seguimiento de progreso)
- Generación dinámica de quizzes con 3 modos
- Seguimiento y análisis de actividad de usuario
- Documentación completa de la API
- Manejo de errores listo para producción
- Herramientas de gestión de administradores
- Página de inicio y sitio web de documentación en español
- Plantilla de reporte de rendimiento de estudiantes

### Agradecimientos

Agradecimiento especial a los instructores del curso de Seguridad en Desarrollo de Software y al equipo de KetzalliLabs por su apoyo durante este proyecto.

---

Hecho con ❤️ por KetzalliLabs
