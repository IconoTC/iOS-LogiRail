//
//  HeroesViewController.swift
//  MVVMTests
//
//  Created by David Jardon on 29/11/23.
//

import UIKit

@MainActor
class HeroesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!

    var viewModel: HeroesViewModel?
    private var dataSource: TableViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        setObservers()
        viewModel?.onViewAppear()
    }

    private func initViews() {
        dataSource = HeroesTableViewDataSource(viewModel: viewModel)
        tableView.register(
            UINib(
                nibName: HeroViewCell.identifier,
                bundle: nil
            ),
            forCellReuseIdentifier: HeroViewCell.identifier
        )

        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }

    private func setObservers() {
        viewModel?.viewState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                    case .loading(let isLoading):
                        self?.loadingView.isHidden = !isLoading

                    case .updateData:
                        self?.tableView.reloadData()
                }
            }
        }
    }
}
