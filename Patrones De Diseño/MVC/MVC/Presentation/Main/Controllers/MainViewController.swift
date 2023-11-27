//
//  MainViewController.swift
//  MVC
//
//  Created by David Jardon on 24/11/23.
//

import UIKit

class MainViewController: UITableViewController {
    private let getAllCharactersUseCase: GetAllCharactersUseCase = DefaultGetAllCharactersUseCase()
    private var data: CharactersModel {
        getAllCharactersUseCase.charactersMock
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }

    private func registerCell() {
        tableView.register(.init(nibName: "MainViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "MainViewCell")
    }
}

extension MainViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainViewCell",
                                                       for: indexPath) as? MainViewCell else {
            return UITableViewCell()
        }

        if indexPath.row < data.count {
            cell.updateViews(image: data[indexPath.row].image)
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < data.count,
              let viewController = UIStoryboard(name: "Detail", bundle: nil).instantiateInitialViewController() as? DetailViewController else {
            return
        }

        let selectedData = data[indexPath.row]
        viewController.data = selectedData
        navigationController?.pushViewController(viewController, animated: true)
    }
}

#Preview {
    MainViewController()
}
