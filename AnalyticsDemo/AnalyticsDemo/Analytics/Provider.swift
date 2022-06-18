//
//  Provider.swift
//  AnalyticsDemo
//
//  Created by Karthik on 18/06/22.
//

import Foundation

protocol AnalyticsProvider {
    func report(event: AnalyticsEvent)
}



class FirebaseAnalyticsProvider: AnalyticsProvider {
    private let eventMapper = AnalyticsEventMapper()
    
    func report(event: AnalyticsEvent) {
        let name = eventMapper.eventName(for: event)
        let parameters = eventMapper.parameters(for: event)
        Analytics.logEvent(name, parameters: parameters)
    }
}

class Analytics {
    static func logEvent(_ name: String, parameters: [String: String]) {
        print("Event logged for Name:\(name)  parameters; \(parameters)")
    }
}

class LoggingAnalyticsProvider: AnalyticsProvider {
    private let eventMapper = AnalyticsEventMapper()
    
    func report(event: AnalyticsEvent) {
        let name = eventMapper.eventName(for: event)
        print("Event reported: \(name)")
    }
}

class TestingAnalyticsProvider: AnalyticsProvider {
    var eventsReported = [AnalyticsEvent]()
    
    func report(event: AnalyticsEvent) {
        eventsReported.append(event)
    }
}





class AnalyticsReporter {
    private let providers: [AnalyticsProvider]
    
    init(providers: [AnalyticsProvider]) {
        self.providers = providers
    }
    
    func report(event: AnalyticsEvent) {
        providers.forEach {
            $0.report(event: event)
        }
    }
}
