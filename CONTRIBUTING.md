# Contributing to react-native-app-exit

Thank you for considering contributing to react-native-app-exit! This document provides guidelines for contributing to the project.

## Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment for everyone.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates. When creating a bug report, include:

- A clear and descriptive title
- Detailed steps to reproduce the issue
- Expected behavior vs actual behavior
- React Native version
- iOS/Android version
- Whether you're using New Architecture or not
- Any relevant logs or error messages

### Suggesting Enhancements

Enhancement suggestions are welcome! Please provide:

- A clear and descriptive title
- Detailed explanation of the proposed feature
- Use cases and examples
- Any potential drawbacks or alternatives considered

### Pull Requests

1. Fork the repository
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test your changes thoroughly on both iOS and Android
5. Test with both old and new architecture if applicable
6. Commit your changes (`git commit -m 'Add some amazing feature'`)
7. Push to the branch (`git push origin feature/amazing-feature`)
8. Open a Pull Request

#### Pull Request Guidelines

- Follow the existing code style
- Add tests if applicable
- Update documentation as needed
- Keep commits atomic and well-described
- Ensure CI passes

## Development Setup

### Prerequisites

- Node.js 16+
- React Native development environment set up
- For iOS: Xcode 13+, CocoaPods
- For Android: Android Studio, JDK 11+

### Setting Up Development Environment

1. Clone the repository:
```bash
git clone https://github.com/theocikos/react-native-app-exit.git
cd react-native-app-exit
```

2. Install dependencies:
```bash
npm install
# or
yarn install
```

3. Run TypeScript compiler:
```bash
npm run typescript
```

4. Run linter:
```bash
npm run lint
```

### Testing Your Changes

#### Testing with Example App

Create a test React Native app:

```bash
npx react-native init TestApp
cd TestApp
npm install ../react-native-app-exit
```

For iOS:
```bash
cd ios && pod install && cd ..
npx react-native run-ios
```

For Android:
```bash
npx react-native run-android
```

#### Testing New Architecture

Enable New Architecture in your test app:

**iOS** - In `Podfile`:
```ruby
ENV['RCT_NEW_ARCH_ENABLED'] = '1'
```

**Android** - In `android/gradle.properties`:
```properties
newArchEnabled=true
```

Then rebuild and test.

## Code Style

This project uses:
- ESLint for JavaScript/TypeScript linting
- Prettier for code formatting

Run before committing:
```bash
npm run lint
```

## Project Structure

```
react-native-app-exit/
├── src/                    # TypeScript source files
│   ├── index.tsx          # Main entry point
│   └── NativeRNAppExit.ts # TurboModule spec
├── android/               # Android native code
│   ├── src/
│   │   ├── main/         # Common implementation
│   │   ├── oldarch/      # Old architecture specific
│   │   └── newarch/      # New architecture specific
│   └── build.gradle
├── ios/                   # iOS native code
│   ├── RNAppExit.h
│   └── RNAppExit.mm
└── react-native-app-exit.podspec
```

## Commit Message Guidelines

Follow conventional commits:

- `feat: Add new feature`
- `fix: Fix bug`
- `docs: Update documentation`
- `style: Code style changes`
- `refactor: Code refactoring`
- `test: Add or update tests`
- `chore: Maintenance tasks`

Example:
```
feat(android): add custom exit code support

- Add exitWithCode method
- Update Android implementation
- Add TypeScript definitions
```

## Questions?

Feel free to open an issue for questions or discussions about contributing.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
