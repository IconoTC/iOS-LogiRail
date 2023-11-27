//
//  MainViewCell.swift
//  MVVM
//
//  Created by David Jardon on 24/11/23.
//

import UIKit

class MainViewCell: UITableViewCell {
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var imageCell: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        viewCell.layer.cornerRadius = 4.0
        viewCell.layer.shadowColor = UIColor.gray.cgColor
        viewCell.layer.shadowOffset = .zero
        viewCell.layer.shadowOpacity = 0.7
        viewCell.layer.shadowRadius = 4.0

        imageCell.layer.cornerRadius = 4.0
        imageCell.layer.opacity = 0.7
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageCell.image = nil
    }

    func updateViews(image: String?) {
        update(image: image)
    }

    private func update(image: String?) {
        imageCell.image = UIImage(named: image ?? "")
    }
}
