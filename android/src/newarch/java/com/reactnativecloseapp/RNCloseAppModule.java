package com.reactnativecloseapp;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;

public class RNCloseAppModule extends NativeRNCloseAppSpec {

    private final RNCloseAppImpl implementation;

    public RNCloseAppModule(ReactApplicationContext reactContext) {
        super(reactContext);
        implementation = new RNCloseAppImpl(reactContext);
    }

    @NonNull
    @Override
    public String getName() {
        return RNCloseAppImpl.NAME;
    }

    @Override
    public void exitApp() {
        implementation.exitApp();
    }
}
