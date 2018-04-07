//
//  TrackingManager.swift
//  Ritual
//
//  Created by Jeremy White on 4/7/18.
//  Copyright © 2018 Namrata Bandekar. All rights reserved.
//

import Foundation
import Mixpanel

class TrackingManager {

    static func initializeMixpanel() {
#if DEBUG
        Mixpanel.initialize(token: "917a8c5350a71e5bfa758863e63f22f3")
#else
        Mixpanel.initialize(token: "")
#endif
        Mixpanel.mainInstance().loggingEnabled = true

        identifyUser()
    }

    static func trackEvent(name: String, eventProperties: [String:
        MixpanelType]? = nil) {
        Mixpanel.mainInstance().track(event: name,
                                      properties: eventProperties)
    }

    static func startTrackingTimedEvent(name: String) {
        Mixpanel.mainInstance().time(event: name)
    }

    static func identifyUser() {
        Mixpanel.mainInstance().identify(distinctId: Mixpanel.mainInstance().distinctId)
    }

    static func storeUserProperties(_ userProperties: [String: MixpanelType]) {
        Mixpanel.mainInstance().people.set(properties: userProperties)
    }

}
