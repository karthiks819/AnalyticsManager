//
//  ViewController.swift
//  AnalyticsDemo
//
//  Created by Karthik on 18/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let reporter = AnalyticsReporter(providers: [
            LoggingAnalyticsProvider(),
            FirebaseAnalyticsProvider()
        ])
        let viewModel = ContactsViewModel(coordinator: ContactsCoordinator(), analyticsReporter: reporter)

        viewModel.contactSelected(at: 3)
        viewModel.addContactTapped()
    }


}

