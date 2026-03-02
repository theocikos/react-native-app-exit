module.exports = {
  dependency: {
    platforms: {
      android: {
        sourceDir: './android',
        packageImportPath: 'import com.reactnativeappexit.RNAppExitPackage;',
        packageInstance: 'new RNAppExitPackage()',
      },
      ios: {
        podspecPath: './RNAppExit.podspec',
      },
    },
  },
};
