//
//  DetailViewModel.swift
//  MVVMTests
//
//  Created by David Jardon on 29/11/23.
//

import Foundation

@MainActor
protocol DetailViewModel: AnyObject {
    var viewState: ((HeroDetailViewState) -> Void)? { get set }

    func onViewAppear()
    func onBackPressed()
}

enum HeroDetailViewState {
    case loading(_ isLoading: Bool)
    case updateData(hero: Hero?, locations: HeroAnnotations?)
}

@MainActor
final class DefaultDetailViewModel: DetailViewModel {
    private let router: Router
    private let getHeroLocationsUseCase: GetHeroLocationsUseCase
    private let heroLocationToAnnotationMapper: HeroLocationToAnnotationMapper

    var viewState: ((HeroDetailViewState) -> Void)?

    private let hero: Hero

    init(
        hero: Hero,
        router: Router,
        getHeroLocationsUseCase: GetHeroLocationsUseCase,
        heroLocationToAnnotationMapper: HeroLocationToAnnotationMapper
    ) {
        self.hero = hero
        self.router = router
        self.getHeroLocationsUseCase = getHeroLocationsUseCase
        self.heroLocationToAnnotationMapper = heroLocationToAnnotationMapper
    }

    func onViewAppear() {
        viewState?(.loading(true))
        initializeHeroData()
    }

    func onBackPressed() {
        router.backPop()
    }

    private func initializeHeroData() {
        Task { [weak self] in
            guard let heroId = self?.hero.id else { return }

            let result = await self?.fetchHeroLocations(for: heroId) ?? []
            let resultMapped = self?.mapHeroLocations(result) ?? []
            self?.updateData(resultMapped)
            self?.viewState?(.loading(false))
        }
    }

    private func fetchHeroLocations(for heroId: String) async -> HeroLocations {
        await getHeroLocationsUseCase.locations(by: heroId)
    }

    private func mapHeroLocations(_ heroLocations: HeroLocations) -> HeroAnnotations {
        heroLocationToAnnotationMapper.map(heroLocations)
    }

    private func updateData(_ locationsAnnotations: HeroAnnotations) {
        viewState?(
            .updateData(
                hero: hero,
                locations: locationsAnnotations
            )
        )
    }
}
