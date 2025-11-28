# GitHub Actions CI/CD Setup

This repository includes automated CI/CD workflows using GitHub Actions for continuous integration and deployment to Railway.

## 📋 Workflows Overview

### 1. CI - Build and Test (`ci.yml`)

**Triggers:**
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop` branches

**Jobs:**
- **Validate**: Builds the project on Node.js 18.x and 20.x
  - Installs dependencies
  - Compiles TypeScript
  - Verifies build output
  - Runs security audit
  - Uploads build artifacts (Node 20.x only)

- **Lint Check**: Validates code quality
  - Checks TypeScript compilation errors
  - Validates project structure
  - Ensures required files exist

- **Dependency Review**: Security scanning (PR only)
  - Reviews dependencies for vulnerabilities
  - Fails on moderate or higher severity issues

- **Build Summary**: Provides workflow summary
  - Aggregates results from all jobs
  - Displays status in GitHub UI

### 2. Deploy to Railway (`railway-deploy.yml`)

**Triggers:**
- Push to `main` branch
- Manual workflow dispatch

**Jobs:**
- **Deploy**: Deploys application to Railway
  - Checks out code
  - Installs dependencies
  - Builds TypeScript project
  - Verifies build output
  - Deploys to Railway using CLI
  - Provides deployment summary

## 🚀 Setup Instructions

### Prerequisites

1. **GitHub Repository**: Ensure your code is in a GitHub repository
2. **Railway Account**: Sign up at [railway.app](https://railway.app)
3. **Railway Project**: Create a new project on Railway

### Railway Setup

#### Step 1: Create Railway Project

1. Go to [Railway Dashboard](https://railway.app/dashboard)
2. Click "New Project"
3. Select "Deploy from GitHub repo"
4. Choose your repository
5. Configure environment variables:
   ```
   NODE_ENV=production
   PORT=3000
   DB_HOST=<your-db-host>
   DB_PORT=5432
   DB_USER=<your-db-user>
   DB_PASSWORD=<your-db-password>
   DB_NAME=<your-db-name>
   R2_ACCOUNT_ID=<your-r2-account-id>
   R2_ACCESS_KEY_ID=<your-r2-access-key>
   R2_SECRET_ACCESS_KEY=<your-r2-secret>
   R2_BUCKET_NAME=<your-bucket-name>
   R2_PUBLIC_URL=<your-public-url>
   FIREBASE_PROJECT_ID=<your-project-id>
   FIREBASE_PRIVATE_KEY=<your-private-key>
   FIREBASE_CLIENT_EMAIL=<your-client-email>
   ```

#### Step 2: Get Railway Token

1. Go to [Railway Account Settings](https://railway.app/account/tokens)
2. Click "Create New Token"
3. Give it a descriptive name (e.g., "GitHub Actions Deploy")
4. Copy the generated token

#### Step 3: Configure GitHub Secrets

1. Go to your GitHub repository
2. Navigate to **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add the following secrets:

   | Secret Name | Description | Required |
   |-------------|-------------|----------|
   | `RAILWAY_TOKEN` | Railway API token from Step 2 | ✅ Yes |
   | `RAILWAY_SERVICE_NAME` | Railway service name (optional) | ❌ No |

**To add a secret:**
- Name: `RAILWAY_TOKEN`
- Value: `<your-railway-token>`
- Click "Add secret"

### Configuration Files

#### Railway Configuration Files

**`railway.json`** - Railway deployment configuration:

```json
{
  "build": {
    "builder": "NIXPACKS",
    "buildCommand": "npm run build"
  },
  "deploy": {
    "startCommand": "npm start",
    "healthcheckPath": "/api/health",
    "healthcheckTimeout": 100,
    "restartPolicyType": "ON_FAILURE",
    "restartPolicyMaxRetries": 10
  }
}
```

**`nixpacks.toml`** - Nixpacks builder configuration (forces Node.js 20.x):

```toml
[phases.setup]
nixPkgs = ['nodejs-20_x']

[phases.install]
cmds = ['npm ci']

[phases.build]
cmds = ['npm run build']

[start]
cmd = 'npm start'
```

**`.nvmrc`** - Node.js version specification:

```
20.x
```

## 🔧 Usage

### Automatic Deployment

- **Push to main**: Automatically triggers deployment to Railway
- **Pull Request**: Runs CI validation but doesn't deploy
- **Push to develop**: Runs CI validation but doesn't deploy

### Manual Deployment

1. Go to **Actions** tab in your repository
2. Select **Deploy to Railway** workflow
3. Click **Run workflow**
4. Select the `main` branch
5. Click **Run workflow** button

## 📊 Monitoring

### CI/CD Status

Check workflow status:
1. Go to **Actions** tab in your repository
2. View recent workflow runs
3. Click on any run to see detailed logs

### Railway Deployment Status

Check deployment status:
1. Go to [Railway Dashboard](https://railway.app/dashboard)
2. Select your project
3. View deployment logs and status
4. Check health endpoint: `https://your-app.railway.app/api/health`

## 🛡️ Security Best Practices

1. **Never commit secrets**: Use GitHub Secrets for sensitive data
2. **Rotate tokens regularly**: Update Railway tokens periodically
3. **Review dependencies**: The workflow includes automatic security audits
4. **Monitor deployments**: Check Railway logs for any issues
5. **Use environment variables**: Store all configuration in Railway environment

## 🐛 Troubleshooting

### Build Fails

**Problem**: TypeScript compilation errors

**Solution**:
- Run `npm run build` locally to identify issues
- Fix TypeScript errors
- Ensure all dependencies are in `package.json`

### Node.js Version Mismatch

**Problem**: Firebase dependencies require Node.js 20+

**Solution**:
- The `nixpacks.toml` file forces Node.js 20.x
- Ensure `.nvmrc` contains `20.x`
- Railway will automatically use the correct version

### Deployment Fails

**Problem**: Railway deployment error

**Solutions**:
1. Verify `RAILWAY_TOKEN` is correctly set in GitHub Secrets
2. Check Railway dashboard for error messages
3. Ensure environment variables are configured in Railway
4. Verify `railway.json` and `nixpacks.toml` are correct

### Health Check Fails

**Problem**: Railway reports unhealthy service

**Solutions**:
1. Check `/api/health` endpoint is accessible
2. Verify database connection in Railway logs
3. Ensure all environment variables are set
4. Check Railway service logs for startup errors

### Cache Issues

**Problem**: EBUSY errors during build

**Solution**:
- The `nixpacks.toml` separates install and build phases
- Railway's cache is properly managed
- If issues persist, trigger a fresh deployment

## 📚 Additional Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Railway Documentation](https://docs.railway.app/)
- [Railway CLI Documentation](https://docs.railway.app/develop/cli)
- [Nixpacks Documentation](https://nixpacks.com/)
- [TypeScript Documentation](https://www.typescriptlang.org/docs/)

## 🤝 Contributing

When contributing:
1. Create a feature branch from `develop`
2. Make your changes
3. Ensure CI passes
4. Create a pull request to `develop`
5. After review and merge, changes will be deployed from `main`

## 📝 Workflow Files

- `.github/workflows/ci.yml` - Continuous Integration
- `.github/workflows/railway-deploy.yml` - Railway Deployment
- `railway.json` - Railway configuration
- `nixpacks.toml` - Nixpacks builder configuration
- `.nvmrc` - Node.js version specification

---

**Note**: Make sure to configure all secrets and environment variables before pushing to the `main` branch to ensure successful deployment.
