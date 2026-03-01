package com.reactnativeappexit;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;

public class RNAppExitModule extends NativeRNAppExitSpec {

    private final RNAppExitImpl implementation;

    public RNAppExitModule(ReactApplicationContext reactContext) {
        super(reactContext);
        implementation = new RNAppExitImpl(reactContext);
    }

    @NonNull
    @Override
    public String getName() {
        return RNAppExitImpl.NAME;
    }

    @Override
    public void exitApp() {
        implementation.exitApp();
    }
}
