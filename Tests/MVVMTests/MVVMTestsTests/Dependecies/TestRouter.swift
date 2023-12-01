//
//  TestRouter.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 28/11/23.
//

import XCTest
@testable import MVVMTests

@MainActor
final class TestRouter: Router {
    var lastNavigatedViewController: UIViewController?
    var lastRouterNavigation: (any RouterNavigation)?

    func backPop() {
        
    }

    func push(to navigation: any RouterNavigation) {
        lastRouterNavigation = navigation
        lastNavigatedViewController = navigation.viewController
    }

    func set(to navigation: any RouterNavigation) {
        lastRouterNavigation = navigation
        lastNavigatedViewController = navigation.viewController
    }
}
