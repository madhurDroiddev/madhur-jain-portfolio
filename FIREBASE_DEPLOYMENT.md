# Firebase Deployment Guide for Flutter Portfolio

This guide will help you deploy your Flutter portfolio to Firebase Hosting.

## 🚀 Quick Answer: Can Firebase Deploy Dynamic Websites?

**YES!** Firebase supports both static and dynamic websites:

- **Firebase Hosting**: Static file hosting (perfect for Flutter web)
- **Firebase Functions**: Serverless backend functions
- **Firestore**: NoSQL database for dynamic data
- **Authentication**: User management
- **Realtime Database**: Real-time data sync

Your Flutter portfolio is **static content**, so Firebase Hosting is perfect!

## 📋 Prerequisites

1. **Google Account** (for Firebase Console)
2. **Node.js** (for Firebase CLI)
3. **GitHub Repository** (your current setup)

## 🛠️ Step-by-Step Setup

### 1. Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project"
3. Enter project name (e.g., "madhur-portfolio")
4. Choose whether to enable Google Analytics (optional)
5. Click "Create project"

### 2. Get Your Project ID

1. In Firebase Console, click the gear icon ⚙️
2. Select "Project settings"
3. Copy the **Project ID** (e.g., "madhur-portfolio-12345")

### 3. Update Firebase Configuration

Replace `your-firebase-project-id` in `.firebaserc` with your actual project ID:

```json
{
  "projects": {
    "default": "madhur-portfolio-12345"
  }
}
```

### 4. Generate Firebase Service Account

1. In Firebase Console → Project Settings → Service Accounts
2. Click "Generate new private key"
3. Download the JSON file
4. **Keep this file secure** - it contains sensitive credentials

### 5. Set Up GitHub Secrets

In your GitHub repository:

1. Go to **Settings** → **Secrets and variables** → **Actions**
2. Add these secrets:

   **FIREBASE_PROJECT_ID**
   - Value: Your Firebase project ID (e.g., "madhur-portfolio-12345")

   **FIREBASE_SERVICE_ACCOUNT**
   - Value: The entire content of the downloaded JSON file

   The workflow maps `FIREBASE_SERVICE_ACCOUNT` to `GCP_SA_KEY` as required by the Firebase GitHub Action.

### 6. Test Local Deployment (Optional)

```bash
# Install Firebase CLI globally
npm install -g firebase-tools

# Login to Firebase
firebase login

# Build Flutter web
flutter build web --release

# Deploy to Firebase
firebase deploy --only hosting
```

## 🔄 GitHub Actions Deployment

The workflow `.github/workflows/firebase-deploy.yml` will:

1. **Build** your Flutter web app
2. **Deploy** to Firebase Hosting automatically
3. **Trigger** on every push to main/master branch

Action used: `w9jds/firebase-action@v14.1.1` with `GCP_SA_KEY`.

## 🌐 Custom Domain (Optional)

1. In Firebase Console → Hosting
2. Click "Add custom domain"
3. Follow the DNS configuration steps
4. Update your domain provider's DNS settings

## 📊 Performance Benefits

Firebase Hosting provides:

- **Global CDN**: Fast loading worldwide
- **HTTPS**: Automatic SSL certificates
- **Caching**: Optimized asset delivery
- **Compression**: Gzip compression
- **Edge Locations**: 200+ locations globally

## 🔧 Configuration Details

### firebase.json
- **public**: Points to `build/web` (Flutter web output)
- **rewrites**: SPA routing for Flutter web
- **headers**: Optimized caching for assets

### Caching Strategy
- **JS/CSS**: 1 year cache (31536000 seconds)
- **Images**: 1 year cache
- **HTML**: No cache (always fresh)

## 🚨 Troubleshooting

### Common Issues:

1. **Build fails**: Check Flutter version compatibility
2. **Deploy fails**: Verify Firebase project ID and service account
3. **404 errors**: Ensure `rewrites` rule is in firebase.json
4. **CORS issues**: Firebase Hosting handles this automatically

### Debug Commands:

```bash
# Check Firebase project
firebase projects:list

# Check hosting configuration
firebase hosting:channel:list

# View deployment history
firebase hosting:releases:list
```

## 📈 Next Steps

After successful deployment:

1. **Monitor**: Check Firebase Console for analytics
2. **Optimize**: Use Lighthouse for performance
3. **Scale**: Add Firebase Functions if needed
4. **Enhance**: Consider adding Firestore for dynamic content

## 🔗 Useful Links

- [Firebase Hosting Documentation](https://firebase.google.com/docs/hosting)
- [Flutter Web Deployment](https://docs.flutter.dev/deployment/web)
- [Firebase CLI Reference](https://firebase.google.com/docs/cli)

---

**Your Flutter portfolio will be live at**: `https://your-project-id.web.app`

Replace `your-project-id` with your actual Firebase project ID!