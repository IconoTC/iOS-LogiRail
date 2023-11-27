//
//  DefaultSplashView.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

class DefaultSplashView: UIViewController, SplashView {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var presenter: SplashPresenterInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewAppear()
    }
}

extension DefaultSplashView: SplashViewInput {
    func showLoading(_ show: Bool) {
        if show && !activityIndicator.isAnimating {
            activityIndicator.startAnimating()
        } else if !show {
            activityIndicator.stopAnimating()
        }
    }
}
