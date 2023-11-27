//
//  DetailPresenter.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

protocol DetailPresenter: AnyObject {
    var router: DetailRouter? { get set }
    var interactor: DetailInteractor? { get set }
    var view: DetailViewInput? { get set }
}

protocol DetailPresenterInput: AnyObject {
    func onViewAppear()
}
