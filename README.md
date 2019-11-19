# Segment<>Braze Middleware

Official repository explaining the `Braze Debounce Identify()` functionality for customers using both products via direct Segment integration. This codebase is only required and maintained for mobile SDK (iOS+Android). For `analytics.js` you can directly similar functionality via [source settings](https://app.segment.com).

# What are middlewares?
Middlewares are a powerful mechanism that can augment the events collected by the SDK. A middleware is a simple function that is invoked by the Segment SDK and can be used to monitor, modify or reject events. They are available under both analytics-{ [ios](https://segment.com/docs/sources/mobile/ios/#middlewares) | [android](https://segment.com/docs/sources/mobile/android/#middlewares)}

# Why was this Braze middleware built?
Segment customers are not charged for duplicate `identify()` calls hence default client app and Segment SDK behavior is to aggresively call this endpoint. Braze on the other hand is priced such that customers are charged per data point stored (incuding duplicates). To help customers avoid overage, this middleware was built for customers to avoid sending duplicate user traits to Braze on every `identify()` call inside Segment.

# Pseudo-code logic of Debounce
The core functionality that this middleware adds can be explained using the following pseudo-code:

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

# How to add this?
You can follow our platform specific guides to help you add this middleware to your native mobile projects:
1. [Android]()
2. [iOS/Swift]()
3. [iOS/Objective-C]()

# More information

Please contact Segment Support for more information on this Debounce middleware, or if you have further questions.
