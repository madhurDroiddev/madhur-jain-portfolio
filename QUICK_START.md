# Quick Start Guide

Get your Flutter portfolio app up and running in minutes!

## 🚀 Quick Setup

### 1. Prerequisites
- Flutter SDK (3.10.0+)
- Git
- GitHub account

### 2. Clone and Setup
```bash
# Clone the repository
git clone https://github.com/yourusername/portfolio_app.git
cd portfolio_app

# Install dependencies
flutter pub get

# Run the app
flutter run -d chrome
```

### 3. Customize Your Information
Edit `lib/models/portfolio_data.dart` to update:
- Your name and contact details
- Work experience
- Skills and proficiency levels
- Projects
- Education

### 4. Deploy to GitHub Pages
```bash
# Make the script executable
chmod +x scripts/deploy.sh

# Deploy to GitHub Pages
./scripts/deploy.sh deploy
```

## 📱 Features Included

✅ **Responsive Design** - Works on all devices  
✅ **Dark/Light Mode** - Theme toggle  
✅ **Cross-Platform** - iOS, Android, Web  
✅ **SEO Optimized** - Search engine friendly  
✅ **Contact Integration** - Direct phone/email links  
✅ **Modern UI** - Material Design 3  
✅ **GitHub Pages Ready** - Automatic deployment  

## 🎨 Customization

### Colors and Theme
Edit `lib/main.dart` to change:
- Primary colors
- Theme configuration
- Responsive breakpoints

### Layout
- Desktop: Side navigation with profile
- Mobile: Drawer navigation
- Tablet: Responsive grid layouts

### Content Sections
1. **Header** - Hero section with contact buttons
2. **About** - Summary and education
3. **Experience** - Work history with achievements
4. **Skills** - Technical skills with progress bars
5. **Projects** - Featured projects with tech tags
6. **Contact** - Contact info and achievements
7. **Footer** - Social links and copyright

## 🌐 Deployment Options

### GitHub Pages (Recommended)
- Free hosting
- Automatic deployment
- Custom domain support
- HTTPS enabled

### Other Options
- **Netlify**: Drag and drop deployment
- **Vercel**: Fast deployment with CLI
- **Firebase**: Google's hosting solution

## 📊 Performance

- **Web**: Optimized for fast loading
- **Mobile**: Native performance
- **SEO**: Proper meta tags
- **Accessibility**: ARIA labels included

## 🔧 Troubleshooting

### Common Issues

1. **Flutter not found**
   ```bash
   # Install Flutter
   flutter doctor
   ```

2. **Build fails**
   ```bash
   # Clean and rebuild
   flutter clean
   flutter pub get
   flutter build web
   ```

3. **Deployment fails**
   - Check GitHub Actions workflow
   - Verify repository settings
   - Ensure repository is public

### Debug Commands
```bash
# Check Flutter installation
flutter doctor

# Analyze code
flutter analyze

# Run tests
flutter test

# Build for specific platform
flutter build web --release
flutter build appbundle --release
flutter build ios --release
```

## 📞 Support

- **Documentation**: Check the main README.md
- **Issues**: Create GitHub issue
- **Flutter Docs**: https://flutter.dev/docs

## 🎯 Next Steps

1. **Customize Content**: Update your information
2. **Add Images**: Place images in `assets/images/`
3. **Deploy**: Use the deployment script
4. **Share**: Share your portfolio URL
5. **Monitor**: Check analytics and performance

---

**Happy Coding! 🚀**

Your portfolio is live at: [https://madhurDroiddev.github.io/madhur-jain-portfolio](https://madhurDroiddev.github.io/madhur-jain-portfolio)