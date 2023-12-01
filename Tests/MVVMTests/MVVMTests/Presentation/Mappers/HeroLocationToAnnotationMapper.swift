//
//  HeroLocationToAnnotationMapper.swift
//  MVVMTests
//
//  Created by David Jardon on 29/11/23.
//

import Foundation

protocol HeroLocationToAnnotationMapper {
    func map(_ data: HeroLocations) -> HeroAnnotations
    func map(_ data: HeroLocation) -> HeroAnnotation?
}

final class DefaultHeroLocationToAnnotationMapper: HeroLocationToAnnotationMapper {
    func map(_ data: HeroLocations) -> HeroAnnotations {
        data.compactMap {
            map($0)
        }
    }

    func map(_ data: HeroLocation) -> HeroAnnotation? {
        guard let latitude = Double(data.latitude ?? ""),
              let longitude = Double(data.longitude ?? "") else {
            return nil
        }

        return .init(
            title: data.hero?.name,
            coordinate: .init(
                latitude: latitude,
                longitude: longitude
            ),
            info: data.date ?? data.hero?.name ?? ""
        )
    }
}
