#!/bin/bash

# Portfolio App Deployment Script
# This script helps build and deploy the Flutter portfolio app

set -e

echo "🚀 Starting Portfolio App Deployment..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Flutter is installed
check_flutter() {
    print_status "Checking Flutter installation..."
    if ! command -v flutter &> /dev/null; then
        print_error "Flutter is not installed. Please install Flutter first."
        exit 1
    fi
    print_success "Flutter is installed"
}

# Clean and get dependencies
setup_project() {
    print_status "Setting up project..."
    flutter clean
    flutter pub get
    print_success "Project setup completed"
}

# Build for web
build_web() {
    print_status "Building for web..."
    flutter build web --release
    print_success "Web build completed"
}

# Build for Android
build_android() {
    print_status "Building for Android..."
    flutter build appbundle --release
    print_success "Android build completed"
}

# Build for iOS
build_ios() {
    print_status "Building for iOS..."
    flutter build ios --release
    print_success "iOS build completed"
}

# Deploy to GitHub Pages
deploy_github_pages() {
    print_status "Deploying to GitHub Pages..."
    
    # Check if git is initialized
    if [ ! -d ".git" ]; then
        print_error "Git repository not initialized. Please run 'git init' first."
        exit 1
    fi
    
    # Check if remote is set
    if ! git remote get-url origin &> /dev/null; then
        print_error "Git remote not set. Please add your GitHub repository as origin."
        exit 1
    fi
    
    # Add all changes
    git add .
    
    # Commit changes
    git commit -m "Deploy portfolio app - $(date)"
    
    # Push to main branch
    git push origin main
    
    print_success "Deployed to GitHub Pages"
    print_status "Your site will be available at: https://yourusername.github.io/portfolio_app"
}

# Show usage
show_usage() {
    echo "Usage: $0 [OPTION]"
    echo ""
    echo "Options:"
    echo "  web         Build and deploy for web only"
    echo "  android     Build for Android only"
    echo "  ios         Build for iOS only"
    echo "  all         Build for all platforms"
    echo "  deploy      Build web and deploy to GitHub Pages"
    echo "  help        Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 web          # Build for web"
    echo "  $0 deploy       # Build and deploy to GitHub Pages"
    echo "  $0 all          # Build for all platforms"
}

# Main script
main() {
    case "${1:-help}" in
        "web")
            check_flutter
            setup_project
            build_web
            print_success "Web build completed successfully!"
            ;;
        "android")
            check_flutter
            setup_project
            build_android
            print_success "Android build completed successfully!"
            ;;
        "ios")
            check_flutter
            setup_project
            build_ios
            print_success "iOS build completed successfully!"
            ;;
        "all")
            check_flutter
            setup_project
            build_web
            build_android
            build_ios
            print_success "All builds completed successfully!"
            ;;
        "deploy")
            check_flutter
            setup_project
            build_web
            deploy_github_pages
            print_success "Deployment completed successfully!"
            ;;
        "help"|*)
            show_usage
            ;;
    esac
}

# Run main function
main "$@"