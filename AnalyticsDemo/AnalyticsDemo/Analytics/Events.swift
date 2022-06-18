//
//  Events.swift
//  AnalyticsDemo
//
//  Created by Karthik on 18/06/22.
//

import Foundation

enum AnalyticsEvent: Equatable {
    case addContactTapped
    case contactSelected(index: Int)
    case messageSent(threadType: ThreadType, length: Int)
    case userSignedIn
}

extension AnalyticsEvent {
    var parameters: [Parameter: String] {
        switch self {
        case .addContactTapped,
                .userSignedIn:
            return [:]
        case let .contactSelected(index):
            return [
                .contactIndex: String(describing: index)
            ]
        case let .messageSent(threadType, length):
            return [
                .threadType: threadType.rawValue,
                .messageLength: String(describing: length)
            ]
        }
    }
    
    enum Parameter: String, Equatable {
        case contactIndex
        case messageLength
        case threadType
    }
}

enum ThreadType: String, Equatable {
    case chat
    case email
    case sms
}
