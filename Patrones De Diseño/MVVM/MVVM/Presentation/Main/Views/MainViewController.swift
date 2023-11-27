//
//  MainViewController.swift
//  MVVM
//
//  Created by David Jardon on 24/11/23.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    var viewState: ((MainViewState) -> Void)? { get set }
    var dataCount: Int { get }

    func onViewAppear()
    func onCharacterPressed(_ index: Int)
    func character(by index: Int) -> CharacterModel?
}

enum MainViewState {
    case updateViews
    case navigateToDetail(_ data: CharacterModel)
}

class MainViewController: UITableViewController {

    var viewModel: MainViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setObservers()
        viewModel?.onViewAppear()
    }

    private func registerCell() {
        tableView.register(.init(nibName: "MainViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "MainViewCell")
    }

    private func setObservers() {
        viewModel?.viewState = { [weak self] state in
            switch state {
                case .updateViews:
                    self?.reloadData()

                case .navigateToDetail(let data):
                    self?.navigateToDetail(with: data)
            }
        }
    }

    private func reloadData() {
        tableView.reloadData()
    }

    private func navigateToDetail(with data: CharacterModel) {
        guard let viewController = UIStoryboard(name: "Detail", bundle: nil).instantiateInitialViewController() as? DetailViewController else {
            return
        }

        viewController.viewModel = DetailViewModel(character: data)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MainViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.dataCount ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainViewCell",
                                                       for: indexPath) as? MainViewCell else {
            return UITableViewCell()
        }

        if let data = viewModel?.character(by: indexPath.row) {
            cell.updateViews(image: data.image)
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.onCharacterPressed(indexPath.row)
    }
}
