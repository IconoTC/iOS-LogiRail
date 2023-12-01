//
//  TableViewDataSource.swift
//  MVVMTests
//
//  Created by David Jardon on 29/11/23.
//

import UIKit

protocol TableViewDataSource: UITableViewDelegate, UITableViewDataSource {

}

final class HeroesTableViewDataSource: NSObject, TableViewDataSource {
    weak var viewModel: HeroesViewModel?

    init(viewModel: HeroesViewModel? = nil) {
        self.viewModel = viewModel
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.heroesCount ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        HeroViewCell.estimatedHeight
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HeroViewCell.identifier,
            for: indexPath
        ) as? HeroViewCell else {
            return UITableViewCell()
        }

        if let hero = viewModel?.heroBy(index: indexPath.row) {
            cell.updateWith(
                photo: hero.photo,
                name: hero.name,
                description: hero.description
            )
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.onHeroSelected(index: indexPath.row)
    }
}
