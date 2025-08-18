# Madhur Jain - Portfolio App

[![Firebase Hosting](https://img.shields.io/badge/Firebase%20Hosting-Live-brightgreen?logo=firebase)](https://madhur-s-portfolio.web.app/)
[![Firebase Deploy Workflow](https://github.com/madhurDroiddev/madhur-jain-portfolio/actions/workflows/firebase-deploy.yml/badge.svg?branch=main)](https://github.com/madhurDroiddev/madhur-jain-portfolio/actions/workflows/firebase-deploy.yml)

Latest workflow runs: https://github.com/madhurDroiddev/madhur-jain-portfolio/actions/workflows/firebase-deploy.yml

A modern, responsive Flutter portfolio application showcasing Madhur Jain's expertise in mobile application development. Built with Flutter for cross-platform support (iOS, Android, and Web).

## 🚀 Features

- **Cross-Platform**: Works on iOS, Android, and Web
- **Responsive Design**: Adapts to different screen sizes and orientations
- **Dark/Light Mode**: Toggle between themes
- **Modern UI**: Clean, professional design with Material Design 3
- **Interactive Elements**: Smooth animations and transitions
- **Contact Integration**: Direct phone and email links
- **SEO Optimized**: Proper meta tags for web deployment

## 📱 Sections

1. **Header**: Hero section with profile and contact information
2. **About**: Professional summary and education
3. **Experience**: Detailed work history with achievements
4. **Skills**: Technical skills with proficiency indicators
5. **Projects**: Featured projects with technology tags
6. **Contact**: Contact information and achievements
7. **Footer**: Social links and copyright

## 🛠️ Technologies Used

- **Flutter**: Cross-platform framework
- **Dart**: Programming language
- **Material Design 3**: UI/UX framework
- **Responsive Framework**: Adaptive layouts
- **Provider**: State management
- **URL Launcher**: External link handling
- **Shared Preferences**: Theme persistence

## 📋 Prerequisites

- Flutter SDK (3.10.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/portfolio_app.git
cd portfolio_app
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the Application

#### For Web:
```bash
flutter run -d chrome
```

#### For Android:
```bash
flutter run -d android
```

#### For iOS:
```bash
flutter run -d ios
```

## 🏗️ Project Structure

```
portfolio_app/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── models/
│   │   └── portfolio_data.dart   # Data models
│   ├── screens/
│   │   └── home_screen.dart      # Main screen
│   ├── services/
│   │   └── theme_service.dart    # Theme management
│   └── widgets/
│       ├── header_widget.dart    # Header section
│       ├── about_section.dart    # About section
│       ├── experience_section.dart # Experience section
│       ├── skills_section.dart   # Skills section
│       ├── projects_section.dart # Projects section
│       ├── contact_section.dart  # Contact section
│       └── footer_widget.dart    # Footer section
├── web/
│   ├── index.html               # Web entry point
│   └── manifest.json            # PWA manifest
├── assets/
│   ├── images/                  # Image assets
│   └── icons/                   # Icon assets
└── pubspec.yaml                 # Dependencies
```

## 🌐 Live Portfolio

**🔗 [View Live Portfolio](https://madhur-s-portfolio.web.app/)**

Hosted on Firebase Hosting with global CDN and HTTPS.

### Manual Deployment

```bash
# Build for web
flutter build web --release

# Deploy to any static hosting service
# Copy build/web/ contents to your hosting provider
```

## 📱 Platform Support

- ✅ **Web**: Fully responsive, PWA support
- ✅ **Android**: Native Android app
- ✅ **iOS**: Native iOS app
- ✅ **Desktop**: Windows, macOS, Linux (with Flutter desktop)

## 🎨 Customization

### Updating Personal Information

Edit `lib/models/portfolio_data.dart` to update:
- Personal details
- Experience history
- Skills and proficiency levels
- Project information
- Contact details

### Styling

- Theme colors: Modify `lib/main.dart`
- Layout adjustments: Edit individual widget files
- Responsive breakpoints: Update `lib/main.dart` responsive wrapper

### Adding New Sections

1. Create a new widget in `lib/widgets/`
2. Add it to `lib/screens/home_screen.dart`
3. Update navigation if needed

## 🔧 Configuration

### Dependencies

Key dependencies in `pubspec.yaml`:
- `responsive_framework`: Responsive design
- `provider`: State management
- `url_launcher`: External links
- `shared_preferences`: Local storage
- `flutter_animate`: Animations
- `firebase_core`: Firebase initialization for web hosting/features

### Web Configuration

- `web/index.html`: SEO meta tags, loading screen
- `web/manifest.json`: PWA configuration
- `.github/workflows/deploy.yml`: CI/CD pipeline

## 📊 Performance

- **Web**: Optimized for fast loading with lazy loading
- **Mobile**: Native performance with platform-specific optimizations
- **SEO**: Proper meta tags and structured data
- **Accessibility**: ARIA labels and keyboard navigation

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test on multiple platforms
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 About the Developer

**Madhur Jain** is a Senior Mobile Application Developer with expertise in:
- Native Android Development (Java, Kotlin)
- Flutter & Dart
- Cross-platform Development
- Clean Architecture & MVVM
- Payment Gateway Integration
- Bluetooth Device Integration
- Enterprise Applications

## 🚀 Deployment

### Firebase Hosting (Current)
- **Live Portfolio**: https://madhur-s-portfolio.web.app/
- **CI/CD**: GitHub Actions (`.github/workflows/deploy.yml`)
- **Config files**: `firebase.json`, `.firebaserc`, `.github/workflows/firebase-deploy.yml`

### GitHub Pages (Legacy)
Previously hosted at: https://madhurDroiddev.github.io/madhur-jain-portfolio

## 📞 Contact

- **Phone**: +91-8287567816
- **Email**: madhur.jain1394@gmail.com
- **LinkedIn**: [Madhur Jain](https://linkedin.com/in/madhurjain)
- **GitHub**: [@madhurjain](https://github.com/madhurjain)
- **Portfolio**: [Live Portfolio](https://madhur-s-portfolio.web.app/)

---

**🎉 Live Portfolio**: [https://madhur-s-portfolio.web.app/](https://madhur-s-portfolio.web.app/)

Made with ❤️ and Flutter