//
//  SplashViewController.swift
//  MVC
//
//  Created by David Jardon on 24/11/23.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !activityIndicator.isAnimating {
            activityIndicator.startAnimating()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        activityIndicator.stopAnimating()
    }

    // MARK: - Private functions -
    private func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? MainViewController else {
                return
            }

            self.navigationController?.setViewControllers([viewController], animated: true)
        }
    }
}
