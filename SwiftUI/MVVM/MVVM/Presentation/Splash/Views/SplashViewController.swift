//
//  SplashViewController.swift
//  MVVM
//
//  Created by David Jardon on 24/11/23.
//

import UIKit

protocol SplashViewDelegate: AnyObject {
    var viewState: ((SplashViewState) -> Void)? { get set }
    func onViewAppear()
    func onViewDisappear()
}

enum SplashViewState {
    case loading(_ isLoading: Bool)
    case navigateToMain
}

class SplashViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var viewModel: SplashViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setObservers()
        viewModel?.onViewAppear()
    }

    override func viewDidDisappear(_ animated: Bool) {
        viewModel?.onViewDisappear()
        super.viewDidDisappear(animated)
    }

    private func setObservers() {
        viewModel?.viewState = { [weak self] state in
            switch state {
                case .loading(let isLoading):
                    self?.showLoading(isLoading)

                case .navigateToMain:
                    self?.navigateToMain()
            }
        }
    }

    private func showLoading(_ show: Bool) {
        if show && !activityIndicator.isAnimating {
            activityIndicator.startAnimating()
        } else if !show {
            activityIndicator.stopAnimating()
        }
    }

    private func navigateToMain() {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? MainViewController else {
            return
        }

        viewController.viewModel = MainViewModel()
        navigationController?.setViewControllers([viewController], animated: true)
    }
}
