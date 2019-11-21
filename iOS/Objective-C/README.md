# Segment<>Braze Middleware / iOS / Objective-C


## Integration
To integrate this middleware under a Swift project please follow these steps:

1. Copy [`BrazeDebounceMiddleware.h`](/iOS/Objective-C/SegmentBrazeDebounce-iOS/BrazeDebounceMiddleware.h) and [`BrazeDebounceMiddleware.m`](/iOS/Objective-C/SegmentBrazeDebounce-iOS/BrazeDebounceMiddleware.m) to your Application's source folder and add the to your project.  This middleware will live in and ship with your app.

2. Add the following to your SEGConfiguration setup (likely in `AppDelegate.m`):
```
// enable our de-bounce middleware
config.middlewares = @[[[BrazeDebounceMiddleware alloc] init]];
```

## Sample App
A sample Objective-C app leveraging this middleware can be seen [here](/iOS/Objective-C/).

## Verification
Looking at the Segment debugger for your source (iOS), Select an `IDENTIFY` event and switch to the `Raw` view.  If de-bounce was applied, you'll be able to see a key in the payload called `integrations` which has an entry `Appboy` that is set to false.  This will instruct segment to NOT send this event to Appboy.
