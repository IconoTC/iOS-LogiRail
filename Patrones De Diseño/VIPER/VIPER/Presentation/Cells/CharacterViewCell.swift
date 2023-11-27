//
//  CharacterViewCell.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

class CharacterViewCell: UITableViewCell {
    static let identifier: String = "CharacterViewCell"

    // MARK: - IBOUTLETS
    @IBOutlet weak var viewHomeCell: UIView!
    @IBOutlet weak var imageHomeCell: UIImageView!

    // MARK: - La primera vez, y me prepara la celda
    override func awakeFromNib() {
        super.awakeFromNib()
        viewHomeCell.layer.cornerRadius = 4.0
        viewHomeCell.layer.shadowColor = UIColor.gray.cgColor
        viewHomeCell.layer.shadowOffset = .zero
        viewHomeCell.layer.shadowOpacity = 0.7
        viewHomeCell.layer.shadowRadius = 4.0

        imageHomeCell.layer.cornerRadius = 4.0
        imageHomeCell.layer.opacity = 0.7
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageHomeCell.image = nil
    }

    func updateViews(image: String) {
        update(image: image)
    }

    // MARK: - METODOS PRIVADAS
    private func update(image: String?) {
        imageHomeCell.image = UIImage(named: image ?? "")
    }
}
