//
//  DefaultMainView.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

class DefaultMainView: UITableViewController, MainView {
    var presenterInput: MainPresenterInput?
    var presenterOutput: MainPresenterOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenterInput?.onViewAppear()
    }
}

extension DefaultMainView: MainViewInput {
    func reloadData() {
        tableView.reloadData()
    }
}

extension DefaultMainView {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenterOutput?.characters.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterViewCell.identifier,
                                                       for: indexPath) as? CharacterViewCell else {
            return UITableViewCell()
        }

        if let data = presenterOutput?.character(by: indexPath.row) {
            cell.updateViews(image: data.image ?? "")
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenterInput?.onCharacterPressed(indexPath.row)
    }
}
