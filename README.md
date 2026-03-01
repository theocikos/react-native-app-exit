# react-native-app-exit

Exit, close, and kill your React Native app programmatically. Works on both iOS and Android with full support for React Native's New Architecture (Turbo Modules).

## Features

- ✅ **New Architecture Support** - Full Turbo Module support for React Native 0.68+
- ✅ **Backward Compatible** - Works with both old and new architecture
- ✅ **TypeScript** - Written in TypeScript with full type definitions
- ✅ **iOS & Android** - Native implementations for both platforms
- ✅ **No Crash Reports** - Gracefully exits without triggering crash notifications

## Installation

```bash
npm install react-native-app-exit
```

or

```bash
yarn add react-native-app-exit
```

### iOS

```bash
cd ios && pod install
```

### Android

No additional steps required. The package auto-links for React Native 0.60+.

## Usage

```typescript
import { exitApp } from 'react-native-app-exit';

// Close the app completely
exitApp();
```

### Example

```typescript
import React from 'react';
import { View, Button } from 'react-native';
import { exitApp } from 'react-native-app-exit';

function App() {
  const handleExit = () => {
    // Perform cleanup operations before exiting
    console.log('Exiting app...');
    exitApp();
  };

  return (
    <View>
      <Button title="Exit App" onPress={handleExit} />
    </View>
  );
}

export default App;
```

## API

### `exitApp()`

Closes the application immediately.

- **Returns:** `void`
- **Platform:** iOS, Android

**Note:** On iOS, this calls `exit(0)` which is generally discouraged by Apple. Use this only when absolutely necessary, as it may appear as a crash to users.

## New Architecture

This package is built with full Turbo Module support. If you're using React Native 0.68+ with the New Architecture enabled, it will automatically use the TurboModule implementation.

## Development & Testing

Want to test this package in a new React Native project? Use the included `install.sh` script:

### Quick Start

```bash
# Install dependencies and build the package
./install.sh install
./install.sh build

# Create a test React Native app
./install.sh test-setup

# Run the test app
./install.sh test-ios        # Test on iOS
./install.sh test-android    # Test on Android
```

The `test-setup` command will create a new React Native app in `../TestAppExit` and install the package locally for testing.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT

---

**⚠️ Important Notes:**

- **iOS:** Apple discourages apps from programmatically exiting. Use this only when absolutely necessary.
- **Android:** The app will be killed using `Process.killProcess()`, which is the recommended way to exit an Android app programmatically.
- This will terminate the app immediately without going through the normal app lifecycle shutdown.
