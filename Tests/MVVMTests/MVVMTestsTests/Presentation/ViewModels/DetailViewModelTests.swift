//
//  DetailViewModelTests.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 29/11/23.
//

import XCTest
import CoreLocation
@testable import MVVMTests

@MainActor
final class DetailViewModelTests: XCTestCase {
    private var sut: DetailViewModel!
    private var testRouter: TestRouter!
    private var testsGetHeroLocationsUseCase: TestsGetHeroLocationsUseCase!
    private var testsHeroLocationToAnnnotationMapper: TestsHeroLocationToAnnnotationMapper!

    private let hero = Hero(id: "1", name: "Hero1", description: "Description1", photo: "photo1", isFavorite: true)
    private let heroLocation = HeroLocation(id: "1", latitude: "12.345", longitude: "-45.678", date: "2023-01-01", hero: nil)
    private let heroAnnotation = HeroAnnotation(title: "Location1", coordinate: CLLocationCoordinate2D(latitude: 12.345, longitude: -45.678), info: "2023-01-01")

    override func setUp() {
        super.setUp()
        
        testRouter = TestRouter()
        testsGetHeroLocationsUseCase = TestsGetHeroLocationsUseCase()
        testsHeroLocationToAnnnotationMapper = TestsHeroLocationToAnnnotationMapper()

        sut = DefaultDetailViewModel(
            hero: hero,
            router: testRouter,
            getHeroLocationsUseCase: testsGetHeroLocationsUseCase,
            heroLocationToAnnotationMapper: testsHeroLocationToAnnnotationMapper
        )
    }

    override func tearDown() {
        testRouter = nil
        testsGetHeroLocationsUseCase = nil
        testsHeroLocationToAnnnotationMapper = nil
        sut = nil
        super.tearDown()
    }

    func testOnViewAppear_WhenHeroLocationsFetchedSuccessfully_ShouldUpdateData() {
        // Arrange
        testsGetHeroLocationsUseCase.locationsResult = [heroLocation]
        testsHeroLocationToAnnnotationMapper.mapHeroLocationsResult = [heroAnnotation]
        let expectation = XCTestExpectation(description: "Expect updateData state to be triggered")

        sut.viewState = { state in
            if case .updateData(let hero, let annotations) = state {
                expectation.fulfill()
                // Assert
                XCTAssertEqual(self.hero.id, hero?.id)
                XCTAssertEqual(annotations?.count, 1)
                XCTAssertEqual(annotations?[0].title, self.heroAnnotation.title)
            }
        }

        // Act
        sut.onViewAppear()

        wait(for: [expectation], timeout: 5.0)
    }
}
