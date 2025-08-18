#!/bin/bash

echo "🚀 Firebase Setup Script for Flutter Portfolio"
echo "=============================================="

# Check if Firebase CLI is installed
if ! command -v firebase &> /dev/null; then
    echo "❌ Firebase CLI not found. Installing..."
    npm install -g firebase-tools
else
    echo "✅ Firebase CLI is installed"
fi

# Check if Flutter is available
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter not found. Please install Flutter first."
    exit 1
else
    echo "✅ Flutter is available"
fi

# Build Flutter web
echo "🔨 Building Flutter web app..."
flutter clean
flutter pub get
flutter build web --release

if [ $? -eq 0 ]; then
    echo "✅ Flutter web build successful"
    echo "📁 Build output: build/web/"
else
    echo "❌ Flutter web build failed"
    exit 1
fi

# Check if firebase.json exists
if [ -f "firebase.json" ]; then
    echo "✅ firebase.json found"
else
    echo "❌ firebase.json not found. Please create it first."
    exit 1
fi

# Check if .firebaserc exists
if [ -f ".firebaserc" ]; then
    echo "✅ .firebaserc found"
    PROJECT_ID=$(grep -o '"default": "[^"]*"' .firebaserc | cut -d'"' -f4)
    if [ "$PROJECT_ID" = "your-firebase-project-id" ]; then
        echo "⚠️  Please update .firebaserc with your actual Firebase project ID"
    else
        echo "✅ Project ID configured: $PROJECT_ID"
    fi
else
    echo "❌ .firebaserc not found. Please create it first."
    exit 1
fi

echo ""
echo "🎉 Setup complete! Next steps:"
echo "1. Update .firebaserc with your Firebase project ID"
echo "2. Run: firebase login"
echo "3. Run: firebase deploy --only hosting"
echo ""
echo "📖 For detailed instructions, see FIREBASE_DEPLOYMENT.md"