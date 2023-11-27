//
//  MainPresenter.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

protocol MainPresenter: AnyObject {
    var router: MainRouterInput? { get set }
    var interactor: MainInteractorOutput? { get set }
    var view: MainViewInput? { get set }
}

protocol MainPresenterInput: AnyObject {
    func onViewAppear()
    func onCharacterPressed(_ index: Int)
}

protocol MainPresenterOutput: AnyObject {
    var characters: CharactersModel { get }
    func character(by index: Int) -> CharacterModel?
}
