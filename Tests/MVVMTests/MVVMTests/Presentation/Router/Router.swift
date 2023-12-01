//
//  Router.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import UIKit

@MainActor
protocol Router {
    func backPop()
    func push(to navigation: any RouterNavigation)
    func set(to navigation: any RouterNavigation)
}

@MainActor
final class DefaultRouter: Router {
    weak private(set) var navigationController: UINavigationController?

    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }

    func backPop() {
        navigationController?.popViewController(animated: true)
    }

    func push(to navigation: any RouterNavigation) {
        guard let nextViewController = navigation.viewController else { return }
        navigationController?.pushViewController(nextViewController, animated: true)
    }

    func set(to navigation: any RouterNavigation) {
        guard let nextViewController = navigation.viewController else { return }
        navigationController?.setViewControllers([nextViewController], animated: true)
    }
}
