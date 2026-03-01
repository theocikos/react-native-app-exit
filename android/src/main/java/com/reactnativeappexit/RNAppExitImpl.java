package com.reactnativeappexit;

import com.facebook.react.bridge.ReactApplicationContext;

public class RNAppExitImpl {

    public static final String NAME = "RNAppExit";

    private final ReactApplicationContext reactContext;

    public RNAppExitImpl(ReactApplicationContext reactContext) {
        this.reactContext = reactContext;
    }

    public void exitApp() {
        android.os.Process.killProcess(android.os.Process.myPid());
    }
}
