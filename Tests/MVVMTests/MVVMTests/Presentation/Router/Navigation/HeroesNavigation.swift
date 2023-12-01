//
//  HeroesNavigation.swift
//  MVVMTests
//
//  Created by David Jardon on 29/11/23.
//

import UIKit
import KeychainSwift

@MainActor
final class HeroesNavigation: RouterNavigation {
    var storyboardName: String {
        "Heroes"
    }

    var viewController: HeroesViewController? {
        let controller = storyboard.instantiateInitialViewController() as? HeroesViewController
        controller?.viewModel = viewModel
        return controller   
    }

    private var viewModel: HeroesViewModel

    init(router: Router) {
        viewModel = DefaultHeroesViewModel(
            router: router,
            getHeroesUseCase: DefaultGetHeroesUseCase(
                heroesService: DefaultApi(
                    apiRequest: ApiRequestURLSession(endpoint: ApiEndpointHeroes()),
                    apiResponse: ApiResponseCodable()
                ),
                secureDataProvider: DefaultSecureDataProvider(
                    secureStoreProvider: KeychainSwift()
                )
            )
        )
    }
}
