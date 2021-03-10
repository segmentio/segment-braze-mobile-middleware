//
//  BrazeDebounceMiddleware.swift
//  SegmentBrazeDebounce-iOS
//
//  Created by Brandon Sneed on 10/22/19.
//  Copyright © 2019 Brandon Sneed. All rights reserved.
//

import Foundation
import Segment

fileprivate let __brazeIntegrationName = "Appboy"

class BrazeDebounceMiddleware: SEGMiddleware {
    var previousIdentifyPayload: SEGIdentifyPayload? = nil
    
    func context(_ context: SEGContext, next: @escaping SEGMiddlewareNext) {
        var workingContext = context
        
        // only process identify payloads.
        guard let identify = workingContext.payload as? SEGIdentifyPayload else { 
            next(workingContext)
            return
        }
        
        if shouldSendToBraze(payload: identify) {
            // we don't need to do anything, it's different content.
        } else {
            // append to integrations such that this will not be sent to braze.
            var integrations = identify.integrations
            integrations[__brazeIntegrationName] = false
            // provide the list of integrations to a new copy of the payload to pass along.
            workingContext = workingContext.modify { (ctx) in
                ctx.payload = SEGIdentifyPayload(userId: identify.userId ?? "",
                                                 anonymousId: identify.anonymousId,
                                                 traits: identify.traits,
                                                 context: identify.context,
                                                 integrations: integrations)
            }
        }
        
        previousIdentifyPayload = identify
        next(workingContext)
    }
    
    func shouldSendToBraze(payload: SEGIdentifyPayload) -> Bool {
        // if userID has changed, send it to braze.
        if payload.userId != previousIdentifyPayload?.userId {
            return true
        }
        
        // if anonymousID has changed, send it to braze.
        if payload.anonymousId != previousIdentifyPayload?.anonymousId {
            return true
        }
        
        // if the traits haven't changed, don't send it to braze.
        if traitsEqual(lhs: payload.traits, rhs: previousIdentifyPayload?.traits) {
            return false
        }
        
        return true
    }
    
    func traitsEqual(lhs: [String: Any]?, rhs: [String: Any]? ) -> Bool {
        var result = false
        
        if lhs == nil && rhs == nil {
            result = true
        }
        
        if let lhs = lhs, let rhs = rhs {
            result = NSDictionary(dictionary: lhs).isEqual(to: rhs)
        }
        
        return result
    }

}

