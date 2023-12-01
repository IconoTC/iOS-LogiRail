//
//  DetailViewController.swift
//  MVVM
//
//  Created by David Jardon on 24/11/23.
//

import UIKit

protocol DetailViewDelegate: AnyObject {
    var viewState: ((DetailViewState) -> Void)? { get set }
    func onViewAppear()
}

enum DetailViewState {
    case updateImage(_ image: String?)
    case updateTitle(_ title: String?)
    case updateDescription(_ description: String?)
}

class DetailViewController: UIViewController {
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var descriptionDetail: UITextView!

    var viewModel: DetailViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setObserves()
        viewModel?.onViewAppear()
    }

    private func setObserves() {
        viewModel?.viewState = { [weak self] state in
            switch state {
                case .updateImage(let image):
                    self?.update(image: image)

                case .updateTitle(let title):
                    self?.update(title: title)

                case .updateDescription(let description):
                    self?.update(description: description)
            }
        }
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
