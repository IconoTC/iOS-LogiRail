//
//  DetailInteractor.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

protocol DetailInteractor: AnyObject {
    var presenter: DetailPresenter? { get set }
}
