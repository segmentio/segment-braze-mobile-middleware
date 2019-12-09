//
//  AppDelegate.swift
//  SegmentBrazeDebounce-iOS
//
//  Created by Brandon Sneed on 10/22/19.
//  Copyright © 2019 Brandon Sneed. All rights reserved.
//

import UIKit
import Analytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let config = SEGAnalyticsConfiguration(writeKey: "YOUR-WRITE-KEY-HERE")
        config.trackApplicationLifecycleEvents = true
        // make things a little easier to debug.
        config.flushInterval = 1
        // enable our de-bounce middleware
        config.middlewares = [BrazeDebounceMiddleware()]
        
        SEGAnalytics.setup(with: config)

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

