package com.reactnativecloseapp;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class RNCloseAppModule extends ReactContextBaseJavaModule {

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

    @ReactMethod
    public void exitApp() {
        implementation.exitApp();
    }
}
