//
//  ViewController.swift
//  UIKit_SwiftUI
//
//  Created by David Jardon on 1/12/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBAction func onNavigationNextPressed() {
        navigateToNext()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSwiftUIButton()
    }

    private func navigateToNext() {
        let mainView = MainView(state: .init())
        let hostingController = UIHostingController(rootView: mainView)
        navigationController?.pushViewController(hostingController, animated: true)
    }

    private func addSwiftUIButton() {
        let floatingButton = FloatingButtonView(icon: Image(systemName: "arrow.right")) { [weak self] in
            self?.navigateToNext()
        }

        let hostingController = UIHostingController(rootView: floatingButton)
        addChild(hostingController)

        view.addSubview(hostingController.view)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostingController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hostingController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)

        hostingController.didMove(toParent: self)
    }
}
