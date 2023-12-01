//
//  HeroesViewModel.swift
//  MVVMTests
//
//  Created by David Jardon on 29/11/23.
//

import Foundation

@MainActor
protocol HeroesViewModel: AnyObject {
    var viewState: ((HeroesViewState) -> Void)? { get set }
    var heroesCount: Int { get }

    func onViewAppear()
    func heroBy(index: Int) -> Hero?
    func onHeroSelected(index: Int)
}

enum HeroesViewState {
    case loading(_ isLoading: Bool)
    case updateData
}

@MainActor
final class DefaultHeroesViewModel: HeroesViewModel {
    private let router: Router
    private let getHeroesUseCase: GetHeroesUseCase

    var viewState: ((HeroesViewState) -> Void)?
    var heroesCount: Int {
        heroes.count
    }

    private var heroes: Heroes = []

    init(
        router: Router,
        getHeroesUseCase: GetHeroesUseCase
    ) {
        self.router = router
        self.getHeroesUseCase = getHeroesUseCase
    }

    func onViewAppear() {
        viewState?(.loading(true))
        initializeHeroesData()
    }

    func heroBy(index: Int) -> Hero? {
        (index >= 0 && index < heroes.count) ? heroes[index] : nil
    }

    func onHeroSelected(index: Int) {
        guard let hero = heroBy(index: index) else { return }
        navigateToDetail(hero)
    }

    func initializeHeroesData() {
        Task { [weak self] in
            let result = await self?.fetchHeroes() ?? []
            self?.updateData(with: result)
            self?.viewState?(.loading(false))
        }
    }

    private func fetchHeroes() async -> Heroes {
        await getHeroesUseCase.heroes()
    }

    private func updateData(with heroes: Heroes) {
        self.heroes = heroes
        viewState?(.updateData)
    }

    private func navigateToDetail(_ hero: Hero) {
        router.push(
            to: DetailNavigation(
                hero: hero,
                router: router
            )
        )
    }
}
