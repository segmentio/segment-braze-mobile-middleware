# Segment<>Braze Middleware / Android / Java

## Integration
To integrate this middleware under a Swift project please follow these steps:

1. Copy [`BrazeDebounceMiddleware.java`](/Android/SegmentBrazeExample/app/src/main/java/com/example/segmentbrazedebounce_android/BrazeDebounceMiddleware.java) to your Application's source folder and add the to your project.  This middleware will live in and ship with your app.

2. Add the following to your Analytics setup (likely in your custom `Application` class):
```
// Enable our de-bounce middleware
.middleware(new BrazeDebounceMiddleware())
```

3. At this point you should have something that closely resembles this:
```
// Create an analytics client with the given context and Segment write key.
Analytics analytics = new Analytics.Builder(this, "ZsjbER8OlDJIuD2JlQdfDHKRP3nJYMEu")
        // Enable this to record certain application events automatically!
        .trackApplicationLifecycleEvents()
        // Enable this to record screen views automatically!
        .recordScreenViews()
        .flushQueueSize(1)
        // Enable our de-bounce middleware
        .middleware(new BrazeDebounceMiddleware())
        .build();
```

## Sample App
A sample Android-Java app leveraging this middleware can be seen [here](/Android/SegmentBrazeExample/).

## Verification
Looking at the Segment debugger for your source (Android), Select an `IDENTIFY` event and switch to the `Raw` view.  If de-bounce was applied, you'll be able to see a key in the payload called `integrations` which has an entry `Appboy` that is set to false.  This will instruct segment to NOT send this event to Appboy.
