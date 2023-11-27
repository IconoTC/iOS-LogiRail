//
//  MainView.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

protocol MainView: AnyObject {
    var presenterInput: MainPresenterInput? { get set }
    var presenterOutput: MainPresenterOutput? { get set }
}

protocol MainViewInput: AnyObject {
    func reloadData()
}
