//
//  DefaultDetailView.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

class DefaultDetailView: UIViewController, DetailView {
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var descriptionDetail: UITextView!

    var presenter: DetailPresenterInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewAppear()
    }

    // MARK: - Private methods -
    private func update(image: String?) {
        imageDetail.image = UIImage(named: image ?? "")
    }

    private func update(title: String?) {
        titleDetail.text = title
    }

    private func update(description: String?) {
        descriptionDetail.text = description
    }
}

extension DefaultDetailView: DetailViewInput {
    func showData(character: CharacterModel) {
        update(image: character.image)
        update(title: character.name)
        update(description: character.description)
    }
}
