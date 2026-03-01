package com.reactnativeappexit;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class RNAppExitModule extends ReactContextBaseJavaModule {

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

    @ReactMethod
    public void exitApp() {
        implementation.exitApp();
    }
}
