//
//  SplashViewController.swift
//  MVVMTests
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

@MainActor
class SplashViewController: UIViewController {
    // MARK: - IBOutlet -
    @IBOutlet weak var loading: UIActivityIndicatorView!

    var viewModel: SplashViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setObservers()
        viewModel?.onViewAppear()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    // MARK: - Private methods -
    private func setObservers() {
        viewModel?.viewState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                    case .loading(let isLoading):
                        self?.showLoading(isLoading)
                }
            }
        }
    }

    private func showLoading(_ show: Bool) {
        loading.isHidden = !show
    }
}
