package com.example.segmentbrazedebounce_android;

import com.segment.analytics.Analytics;
import android.app.Application;

public class MyApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();

        // Create an analytics client with the given context and Segment write key.
        Analytics analytics = new Analytics.Builder(this, "ZsjbER8OlDJIuD2JlQdfDHKRP3nJYMEu")
                // Enable this to record certain application events automatically!
                .trackApplicationLifecycleEvents()
                // Enable this to record screen views automatically!
                .recordScreenViews()
                .flushQueueSize(1)
                .middleware(new BrazeDebounceMiddleware())
                .build();

        // Set the initialized instance as a globally accessible instance.
        Analytics.setSingletonInstance(analytics);
    }
}
