//
//  ContactsViewModel.swift
//  AnalyticsDemo
//
//  Created by Karthik on 18/06/22.
//

import Foundation

class ContactsViewModel {
    private let coordinator: ContactsCoordinator
    private let analyticsReporter: AnalyticsReporter
    
    init(coordinator: ContactsCoordinator, analyticsReporter: AnalyticsReporter) {
        self.coordinator = coordinator
        self.analyticsReporter = analyticsReporter
    }
    
    func contactSelected(at index: Int) {
        analyticsReporter.report(event: .contactSelected(index: index))
        coordinator.startContactThreads(at: index)
    }
    
    func addContactTapped() {
        analyticsReporter.report(event: .addContactTapped)
        coordinator.startContactCreation()
    }
}
