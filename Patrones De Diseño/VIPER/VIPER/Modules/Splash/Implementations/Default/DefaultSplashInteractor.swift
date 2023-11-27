//
//  DefaultSplashInteractor.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

class DefaultSplashInteractor: SplashInteractor {
    weak var presenter: SplashPresenter?
}

extension DefaultSplashInteractor: SplashInteractorInput {
    func checkUserSession(_ completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            completion(true)
        }
    }
}
