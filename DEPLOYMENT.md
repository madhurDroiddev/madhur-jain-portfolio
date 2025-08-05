# Deployment Guide

This guide will help you deploy your Flutter portfolio app to various platforms.

## 🌐 GitHub Pages Deployment

### Prerequisites
- GitHub account
- Flutter SDK installed
- Git installed

### Step 1: Create GitHub Repository

1. Go to GitHub and create a new repository
2. Name it `portfolio_app` or your preferred name
3. Make it public (required for GitHub Pages)

### Step 2: Push Code to GitHub

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit changes
git commit -m "Initial commit: Portfolio app"

# Add remote repository
git remote add origin https://github.com/yourusername/portfolio_app.git

# Push to main branch
git push -u origin main
```

### Step 3: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click on "Settings" tab
3. Scroll down to "Pages" section
4. Under "Source", select "GitHub Actions"
5. The workflow will automatically build and deploy your app

### Step 4: Configure Repository Settings

1. Go to repository Settings > Pages
2. Ensure "GitHub Actions" is selected as source
3. Your site will be available at: `https://yourusername.github.io/portfolio_app`

## 📱 Mobile App Deployment

### Android (Google Play Store)

1. **Build APK/AAB**:
   ```bash
   flutter build appbundle --release
   ```

2. **Sign the App**:
   - Create a keystore file
   - Configure signing in `android/app/build.gradle`
   - Add keystore details to `key.properties`

3. **Upload to Play Console**:
   - Create developer account
   - Upload the AAB file
   - Fill in app details and screenshots

### iOS (App Store)

1. **Build for iOS**:
   ```bash
   flutter build ios --release
   ```

2. **Archive in Xcode**:
   - Open `ios/Runner.xcworkspace` in Xcode
   - Select "Any iOS Device" as target
   - Product > Archive

3. **Upload to App Store Connect**:
   - Create developer account
   - Upload through Xcode or Application Loader

## 🖥️ Desktop Deployment

### Windows

```bash
flutter build windows --release
```

### macOS

```bash
flutter build macos --release
```

### Linux

```bash
flutter build linux --release
```

## ☁️ Other Hosting Options

### Netlify

1. **Build the app**:
   ```bash
   flutter build web --release
   ```

2. **Deploy to Netlify**:
   - Drag and drop `build/web` folder to Netlify
   - Or connect your GitHub repository

### Vercel

1. **Install Vercel CLI**:
   ```bash
   npm i -g vercel
   ```

2. **Deploy**:
   ```bash
   flutter build web --release
   cd build/web
   vercel
   ```

### Firebase Hosting

1. **Install Firebase CLI**:
   ```bash
   npm install -g firebase-tools
   ```

2. **Initialize Firebase**:
   ```bash
   firebase login
   firebase init hosting
   ```

3. **Build and Deploy**:
   ```bash
   flutter build web --release
   firebase deploy
   ```

## 🔧 Configuration

### Custom Domain

1. **Purchase domain** from any registrar
2. **Add CNAME record** pointing to `yourusername.github.io`
3. **Configure in GitHub Pages**:
   - Go to repository Settings > Pages
   - Add custom domain
   - Enable HTTPS

### Environment Variables

Create `.env` file for sensitive data:
```
GITHUB_TOKEN=your_github_token
FIREBASE_API_KEY=your_firebase_key
```

### SEO Optimization

Update `web/index.html` with:
- Meta tags
- Open Graph tags
- Twitter Card tags
- Structured data

## 🚀 Performance Optimization

### Web

1. **Enable compression** on your hosting provider
2. **Use CDN** for static assets
3. **Optimize images** before adding to assets
4. **Enable caching** headers

### Mobile

1. **Optimize app size**:
   ```bash
   flutter build appbundle --target-platform android-arm64
   ```

2. **Enable R8/ProGuard** for Android
3. **Use App Bundle** instead of APK

## 📊 Analytics

### Google Analytics

1. **Create GA4 property**
2. **Add tracking code** to `web/index.html`
3. **Configure events** for user interactions

### Firebase Analytics

1. **Add Firebase SDK** to your app
2. **Configure events** in your Flutter code
3. **View analytics** in Firebase Console

## 🔒 Security

### HTTPS

- Enable HTTPS on all hosting platforms
- Use secure headers
- Implement CSP (Content Security Policy)

### App Security

- Use secure storage for sensitive data
- Implement proper authentication
- Validate all inputs

## 📈 Monitoring

### Error Tracking

1. **Sentry**:
   ```dart
   import 'package:sentry_flutter/sentry_flutter.dart';
   ```

2. **Firebase Crashlytics**:
   ```dart
   import 'package:firebase_crashlytics/firebase_crashlytics.dart';
   ```

### Performance Monitoring

1. **Firebase Performance**:
   ```dart
   import 'package:firebase_performance/firebase_performance.dart';
   ```

## 🛠️ Troubleshooting

### Common Issues

1. **Build fails**: Check Flutter version and dependencies
2. **Deployment fails**: Verify GitHub Actions workflow
3. **App crashes**: Check error logs and implement error handling
4. **Performance issues**: Optimize images and code

### Debug Commands

```bash
# Check Flutter installation
flutter doctor

# Clean and rebuild
flutter clean
flutter pub get
flutter build web --release

# Check for issues
flutter analyze
flutter test
```

## 📞 Support

For deployment issues:
- Check Flutter documentation
- Review hosting provider docs
- Check GitHub Actions logs
- Contact hosting provider support

---

**Happy Deploying! 🚀**