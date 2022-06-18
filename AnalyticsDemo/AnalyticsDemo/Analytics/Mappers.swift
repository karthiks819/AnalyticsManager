//
//  Mappers.swift
//  AnalyticsDemo
//
//  Created by Karthik on 18/06/22.
//

import Foundation

// MARK: Mapper
class AnalyticsEventMapper {
    func eventName(for event: AnalyticsEvent) -> String {
        switch event {
        case .addContactTapped:
            return "addContact_tapped"
        case .contactSelected:
            return "contact_selected"
        case .messageSent:
            return "message_sent"
        case .userSignedIn:
            return "user_signedIn"
        }
    }
    
    func parameters(for event: AnalyticsEvent) -> [String: String] {
        var newParameters = [String: String]()
        event.parameters.forEach { key, value in
            let newKey = parameterName(for: key)
            newParameters[newKey] = value
        }
        return newParameters
    }
    
    func parameterName(for parameter: AnalyticsEvent.Parameter) -> String {
        switch parameter {
        case .contactIndex:
            return "contact_index"
        case .messageLength:
            return "message_length"
        case .threadType:
            return "thread_type"
        }
    }
}
