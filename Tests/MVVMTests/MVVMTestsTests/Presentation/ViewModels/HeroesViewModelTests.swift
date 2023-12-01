//
//  HeroesViewModelTests.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 29/11/23.
//

import XCTest
@testable import MVVMTests

@MainActor
final class HeroesViewModelTests: XCTestCase {
    private var sut: HeroesViewModel!
    private var testRouter: TestRouter!
    private var testGetHeroesUseCase: TestsGetHeroesUseCase!

    private let mockHeroes =  [
        Hero(id: "1", name: "Hero1", description: "Description1", photo: "photo1", isFavorite: true),
        Hero(id: "2", name: "Hero2", description: "Description2", photo: "photo2", isFavorite: false)
    ]

    override func setUp() {
        super.setUp()

        testRouter = TestRouter()
        testGetHeroesUseCase = TestsGetHeroesUseCase()

        sut = DefaultHeroesViewModel(
            router: testRouter,
            getHeroesUseCase: testGetHeroesUseCase
        )
    }

    override func tearDown() {
        testRouter = nil
        testGetHeroesUseCase = nil
        sut = nil
        super.tearDown()
    }

    func testOnViewAppear_WhenHeroesFetchSuccessfully_ShouldUpdateData() {
        // Arrange
        testGetHeroesUseCase.heroesResult = mockHeroes
        let expectationData = XCTestExpectation(description: "")

        sut.viewState = { state in
            if case .updateData = state {
                expectationData.fulfill()
            }
        }

        // Act
        sut.onViewAppear()

        // Assert
        wait(for: [expectationData], timeout: 5.0)
    }

    func testHeroesCount_WhenHeroesFetchSuccessfully_ShouldReturnCorrectCount() {
        // Arrange
        testGetHeroesUseCase.heroesResult = mockHeroes
        let expectedCount = mockHeroes.count
        let expectationData = XCTestExpectation(description: "")

        sut.viewState = { state in
            if case .updateData = state {
                expectationData.fulfill()
            }
        }

        sut.onViewAppear()

        wait(for: [expectationData], timeout: 5.0)

        // Act
        let count = sut.heroesCount

        // Assert
        XCTAssertEqual(expectedCount, count)
    }

    func testHeroBy_WhenIndexIsValid_ShouldReturnCorrectHero() {
        // Arrange
        testGetHeroesUseCase.heroesResult = mockHeroes
        let index = 0
        let heroExpected = mockHeroes[index]
        let expectationData = XCTestExpectation(description: "")

        sut.viewState = { state in
            if case .updateData = state {
                expectationData.fulfill()
            }
        }

        sut.onViewAppear()

        wait(for: [expectationData], timeout: 5.0)

        // Act
        let hero = sut.heroBy(index: index)

        // Assert
        XCTAssertEqual(heroExpected.id, hero?.id)
    }

    func testHeroBy_WhenIndexIsNotValid_ShouldReturnNilHero() {
        // Arrange
        testGetHeroesUseCase.heroesResult = mockHeroes
        let index = -1
        let expectationData = XCTestExpectation(description: "")

        sut.viewState = { state in
            if case .updateData = state {
                expectationData.fulfill()
            }
        }

        sut.onViewAppear()

        wait(for: [expectationData], timeout: 5.0)

        // Act
        let hero = sut.heroBy(index: index)

        // Assert
        XCTAssertNil(hero)
    }

    func testHeroPressed_WhenIndexIsValid_ShouldNavigateToDetail() {
        // Arrange
        testGetHeroesUseCase.heroesResult = mockHeroes
        let index = 0
        let expectationData = XCTestExpectation(description: "")

        sut.viewState = { state in
            if case .updateData = state {
                expectationData.fulfill()
            }
        }

        sut.onViewAppear()

        wait(for: [expectationData], timeout: 5.0)

        // Act
        sut.onHeroSelected(index: index)

        // Assert
        XCTAssertTrue(testRouter.lastNavigatedViewController is DetailViewController)
    }

    func testHeroPressed_WhenIndexIsNotValid_ShouldNotNavigateToDetail() {
        // Arrange
        testGetHeroesUseCase.heroesResult = mockHeroes
        let index = -1
        let expectationData = XCTestExpectation(description: "")

        sut.viewState = { state in
            if case .updateData = state {
                expectationData.fulfill()
            }
        }

        sut.onViewAppear()

        wait(for: [expectationData], timeout: 5.0)

        // Act
        sut.onHeroSelected(index: index)

        // Assert
        XCTAssertFalse(testRouter.lastNavigatedViewController is DetailViewController)
    }
}
