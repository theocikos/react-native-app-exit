#!/bin/bash

# Installation and Testing Script for react-native-app-exit
# This script helps you set up and test the package

set -e

echo "🚀 react-native-app-exit - Installation & Testing Helper"
echo "=========================================================="
echo ""

# Function to print colored output
print_step() {
    echo "📦 $1"
}

print_success() {
    echo "✅ $1"
}

print_error() {
    echo "❌ $1"
}

print_warning() {
    echo "⚠️  $1"
}

# Check if we're in the package directory
if [ ! -f "package.json" ]; then
    print_error "Please run this script from the react-native-app-exit root directory"
    exit 1
fi

# Parse command
case "$1" in
    "install")
        print_step "Installing dependencies..."
        npm install
        print_success "Dependencies installed!"
        ;;
        
    "build")
        print_step "Building the package..."
        npm run prepare
        print_success "Package built successfully!"
        ;;
        
    "test-setup")
        print_step "Setting up test React Native app..."
        
        if [ -d "../TestCloseApp" ]; then
            print_warning "TestCloseApp directory already exists. Remove it? (y/n)"
            read -r response
            if [ "$response" = "y" ]; then
                rm -rf ../TestCloseApp
            else
                print_error "Cancelled"
                exit 1
            fi
        fi
        
        cd ..
        print_step "Creating new React Native app..."
        npx @react-native-community/cli@latest init TestCloseApp --version 0.76.0
        
        cd TestCloseApp
        print_step "Installing react-native-app-exit..."
        npm install ../react-native-app-exit
        
        print_step "Setting up iOS..."
        cd ios && pod install && cd ..
        
        print_success "Test app created at ../TestCloseApp"
        print_warning "Update App.tsx with the following code:"
        echo ""
        cat << 'EOF'
import React from 'react';
import { View, Button, StyleSheet, Alert } from 'react-native';
import { exitApp } from 'react-native-app-exit';

function App() {
  const handleExit = () => {
    Alert.alert(
      'Exit App',
      'Are you sure you want to exit?',
      [
        { text: 'Cancel', style: 'cancel' },
        { text: 'Exit', onPress: () => exitApp(), style: 'destructive' },
      ]
    );
  };

  return (
    <View style={styles.container}>
      <Button title="Exit App" onPress={handleExit} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, justifyContent: 'center', alignItems: 'center' },
});

export default App;
EOF
        ;;
        
    "test-ios")
        print_step "Running iOS test..."
        if [ ! -d "../TestCloseApp" ]; then
            print_error "Test app not found. Run: ./install.sh test-setup"
            exit 1
        fi
        cd ../TestCloseApp
        npx react-native run-ios
        ;;
        
    "test-android")
        print_step "Running Android test..."
        if [ ! -d "../TestCloseApp" ]; then
            print_error "Test app not found. Run: ./install.sh test-setup"
            exit 1
        fi
        cd ../TestCloseApp
        npx react-native run-android
        ;;
        
    "test-new-arch-ios")
        print_step "Setting up iOS with New Architecture..."
        if [ ! -d "../TestCloseApp" ]; then
            print_error "Test app not found. Run: ./install.sh test-setup"
            exit 1
        fi
        
        cd ../TestCloseApp/ios
        
        # Add to Podfile
        if ! grep -q "RCT_NEW_ARCH_ENABLED" Podfile; then
            echo "ENV['RCT_NEW_ARCH_ENABLED'] = '1'" | cat - Podfile > temp && mv temp Podfile
            print_success "Added RCT_NEW_ARCH_ENABLED to Podfile"
        fi
        
        pod install
        cd ..
        print_success "iOS New Architecture enabled"
        npx react-native run-ios
        ;;
        
    "test-new-arch-android")
        print_step "Setting up Android with New Architecture..."
        if [ ! -d "../TestCloseApp" ]; then
            print_error "Test app not found. Run: ./install.sh test-setup"
            exit 1
        fi
        
        cd ../TestCloseApp
        
        # Add to gradle.properties
        if ! grep -q "newArchEnabled" android/gradle.properties; then
            echo "newArchEnabled=true" >> android/gradle.properties
            print_success "Added newArchEnabled to gradle.properties"
        fi
        
        print_success "Android New Architecture enabled"
        npx react-native run-android
        ;;
        
    "clean")
        print_step "Cleaning build artifacts..."
        rm -rf lib node_modules
        print_success "Cleaned!"
        ;;
        
    "publish-check")
        print_step "Checking if ready to publish..."
        
        # Check if lib folder exists
        if [ ! -d "lib" ]; then
            print_error "lib/ folder not found. Run: ./install.sh build"
            exit 1
        fi
        
        # Check version
        version=$(node -p "require('./package.json').version")
        print_step "Current version: $version"
        
        # Check if git is clean
        if ! git diff-index --quiet HEAD --; then
            print_warning "Git working directory is not clean"
        fi
        
        print_success "Package looks ready to publish!"
        print_warning "Run: npm publish (or npm run release)"
        ;;
        
    *)
        echo "Usage: ./install.sh [command]"
        echo ""
        echo "Commands:"
        echo "  install              - Install package dependencies"
        echo "  build                - Build the package"
        echo "  test-setup           - Create a test React Native app"
        echo "  test-ios             - Run iOS test"
        echo "  test-android         - Run Android test"
        echo "  test-new-arch-ios    - Run iOS test with New Architecture"
        echo "  test-new-arch-android - Run Android test with New Architecture"
        echo "  clean                - Clean build artifacts"
        echo "  publish-check        - Check if ready to publish"
        echo ""
        echo "Example workflow:"
        echo "  ./install.sh install"
        echo "  ./install.sh build"
        echo "  ./install.sh test-setup"
        echo "  ./install.sh test-ios"
        ;;
esac
