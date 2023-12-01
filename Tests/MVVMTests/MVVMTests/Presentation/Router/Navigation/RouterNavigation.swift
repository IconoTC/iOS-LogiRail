//
//  RouterNavigation.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import UIKit

@MainActor
protocol RouterNavigation {
    associatedtype T: UIViewController

    var storyboardName: String { get }
    var storyboard: UIStoryboard { get }
    var viewController: T? { get }
}

extension RouterNavigation {
    var storyboard: UIStoryboard {
        UIStoryboard(name: storyboardName, bundle: nil)
    }
}
