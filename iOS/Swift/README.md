# Segment<>Braze Middleware / iOS / Swift

## Integration
To integrate this middleware under a Swift project please follow these steps:

1. Copy [`BrazeDebounceMiddleware.swift`](/iOS/Swift/SegmentBrazeDebounce-iOS/BrazeDebounceMiddleware.swift) to your Application's source folder and add it to your project.  This middleware will live in and ship with your app.  

2. Add the following to your SEGConfiguration setup (likely in `AppDelegate.swift`):
```
// enable our de-bounce middleware
config.middlewares = [BrazeDebounceMiddleware()]
```

## Verification
Looking at the Segment debugger for your source (iOS), select an `IDENTIFY` event and switch to the `Raw` view.  If de-bounce was applied, you'll be able to see a key in the payload called `integrations` which has an entry `Appboy` that is set to false.  This will instruct Segment to NOT send this event to Appboy.
