//
//  MainInteractor.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

protocol MainInteractor: AnyObject {
    var presenter: MainPresenter? { get set }
}

protocol MainInteractorOutput: AnyObject {
    func characters() async -> CharactersModel
}
