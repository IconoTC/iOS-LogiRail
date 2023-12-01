//
//  HeroViewCell.swift
//  MVVMTests
//
//  Created by David Jardon on 29/11/23.
//

import UIKit
import Kingfisher

class HeroViewCell: UITableViewCell {
    static let estimatedHeight: CGFloat = 256
    static let identifier: String = "HeroViewCell"

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var about: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()

        containerView.layer.cornerRadius = 8.0
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 8.0
        containerView.layer.shadowOpacity = 0.6

        photo.layer.cornerRadius = 8.0
        photo.layer.maskedCorners = [.layerMinXMaxYCorner]

        selectionStyle = .none
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        name.text = nil
        photo.image = nil
        about.text = nil
    }

    func updateWith(
        photo: String?,
        name: String?,
        description: String?
    ) {
        self.photo.kf.setImage(with: URL(string: photo ?? ""))
        self.name.text = name
        self.about.text = description
    }
}
