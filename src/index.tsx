import NativeRNCloseApp from './NativeRNCloseApp';

/**
 * Exits the React Native application immediately.
 * 
 * @platform iOS, Android
 * 
 * **Important Notes:**
 * - On iOS, this calls exit(0) which is discouraged by Apple.
 * - On Android, this kills the process using Process.killProcess().
 * - The app will terminate immediately without going through normal lifecycle.
 * - Use this only when absolutely necessary.
 * 
 * @example
 * ```typescript
 * import { exitApp } from 'react-native-app-exit';
 * 
 * // Exit the app
 * exitApp();
 * ```
 */
export function exitApp(): void {
  NativeRNCloseApp.exitApp();
}

/**
 * Alias for exitApp
 * @see exitApp
 */
export function closeApp(): void {
  NativeRNCloseApp.exitApp();
}

/**
 * Alias for exitApp
 * @see exitApp
 */
export function killApp(): void {
  NativeRNCloseApp.exitApp();
}

// Default export for convenience
export default {
  exitApp,
  closeApp,
  killApp,
};
