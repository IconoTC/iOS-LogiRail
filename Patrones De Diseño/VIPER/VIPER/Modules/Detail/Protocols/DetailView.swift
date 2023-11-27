//
//  DetailView.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

protocol DetailView: AnyObject {
    var presenter: DetailPresenterInput? { get set }
}

protocol DetailViewInput: AnyObject {
    func showData(character: CharacterModel)
}
