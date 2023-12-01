//
//  DetailNavigation.swift
//  MVVMTests
//
//  Created by David Jardon on 29/11/23.
//

import UIKit
import KeychainSwift

@MainActor
final class DetailNavigation: RouterNavigation {
    var storyboardName: String {
        "Detail"
    }

    var viewController: DetailViewController? {
        let controller = storyboard.instantiateInitialViewController() as? DetailViewController
        controller?.viewModel = viewModel
        return controller
    }

    private var viewModel: DetailViewModel

    init(
        hero: Hero,
        router: Router
    ) {
        viewModel = DefaultDetailViewModel(
            hero: hero,
            router: router,
            getHeroLocationsUseCase: DefaultGetHeroLocationsUseCase(
                heroLocationsService: DefaultApi(
                    apiRequest: ApiRequestURLSession(endpoint: ApiEndpointHeroLocations()),
                    apiResponse: ApiResponseCodable()
                ),
                secureDataProvider: DefaultSecureDataProvider(
                    secureStoreProvider: KeychainSwift()
                )
            ), 
            heroLocationToAnnotationMapper: DefaultHeroLocationToAnnotationMapper()
        )
    }
}
