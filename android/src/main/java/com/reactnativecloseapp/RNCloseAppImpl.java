package com.reactnativecloseapp;

import com.facebook.react.bridge.ReactApplicationContext;

public class RNCloseAppImpl {

    public static final String NAME = "RNCloseApp";

    private final ReactApplicationContext reactContext;

    public RNCloseAppImpl(ReactApplicationContext reactContext) {
        this.reactContext = reactContext;
    }

    public void exitApp() {
        android.os.Process.killProcess(android.os.Process.myPid());
    }
}
