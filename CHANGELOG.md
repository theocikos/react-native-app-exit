# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-02-25

### Added
- Initial release of react-native-app-exit
- Full React Native New Architecture support (Turbo Modules)
- Backward compatibility with old architecture
- iOS implementation using Objective-C++
- Android implementation with separate old/new arch modules
- TypeScript definitions
- Simple API with single method: `exitApp()`
- Comprehensive documentation and examples
- Auto-linking support for React Native 0.60+

### Features
- Cross-platform support (iOS & Android)
- No crash reports triggered
- Proper codegen configuration
- Modern package structure using react-native-builder-bob
- Full TypeScript support

### Planned
- tvOS support
- Additional exit methods with custom codes
- Graceful shutdown options
