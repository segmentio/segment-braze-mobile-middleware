# SegmentBrazeDebounce-examples
Examples of how to implement Braze debounce for Analytics.js, iOS and Android

# Why is Debounce needed?

# Pseudo-code logic of Debounce

```
if payload is IdentityPayload {
    if payload.userId != lastUserID or
       payload.anonymousId != lastAnonymousID or
       payload.traits != lastTraits {
            // do nothing, it'll get sent like normal.
       } else {
            removeBrazeFromDestionationList()
       }
}
```

# Swift Usage Example

Copy `BrazeDebounceMiddleware.swift` to your Application's source foler and add it to your project.  This middleware will live in and ship with your app.  

Once you've done this, add the following to your SEGConfiguration setup (likely in `AppDelegate.swift`):

```
// enable our de-bounce middleware
config.middlewares = [BrazeDebounceMiddleware()]
```

# Objective-C Usage Example

Copy `BrazeDebounceMiddleware.h` and `BrazeDebounceMiddleware.m` to your Application's source folder and add the to your project.  This middleware will live in and ship with your app.

Once you've done this, add the following to your SEGConfiguration setup (likely in `AppDelegate.m`):

```
// enable our de-bounce middleware
config.middlewares = @[[[BrazeDebounceMiddleware alloc] init]];
```

# Android Usage Example

Copy `BrazeDebounceMiddleware.java` to your Application's source folder and add the to your project.  This middleware will live in and ship with your app.

Once you've done this, add the following to your Analytics setup (likely in your custom `Application` class):

```
// Enable our de-bounce middleware
.middleware(new BrazeDebounceMiddleware())
```

At this point you should have something that closely resembles this:

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

# Verification

Looking at the Segment debugger for your source (iOS/Android), Select an `IDENTIFY` event and switch to the `Raw` view.  If de-bounce was applied, you'll be able to see a key in the payload called `integrations` which has an entry `Appboy` that is set to false.  This will instruct segment to NOT send this event to Appboy.

# More information

Please contact Segment Support for more information on this Debounce middleware, or if you have further questions.
