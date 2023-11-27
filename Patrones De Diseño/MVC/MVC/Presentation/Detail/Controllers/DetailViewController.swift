//
//  DetailViewController.swift
//  MVC
//
//  Created by David Jardon on 24/11/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var descriptionDetail: UITextView!

    var data: CharacterModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews(with: data)
    }

    // MARK: - Private functions -
    private func updateViews(with data: CharacterModel?) {
        update(image: data?.image)
        update(title: data?.name)
        update(description: data?.description)
    }

    private func update(title: String?) {
        titleDetail.text = title
    }

    private func update(image: String?) {
        imageDetail.image = UIImage(named: image ?? "")
    }

    private func update(description: String?) {
        descriptionDetail.text = description
    }
}

#Preview {
    let viewController = DetailViewController()
    viewController.data = .init(
        name: "Bart Simpson",
        job: "Estudiante en la Escuela primaria de Springfield",
        image: "bart_simpson",
        description: "conocido como El Barto y Bartman , es el hijo mayor travieso, rebelde, incomprendido y potencialmente peligroso de Homer y Marge Simpson, y el hermano de Lisa y Maggie Simpson"
    )

    return viewController
}
