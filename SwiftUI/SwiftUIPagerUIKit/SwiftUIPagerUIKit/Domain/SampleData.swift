//
//  SampleData.swift
//  SwiftUIPagerUIKit
//
//  Created by David Jardon on 1/12/23.
//

import Foundation

@Observable
class SampleData {
    var landmaks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")

    var features: [Landmark] {
        landmaks.filter {
            $0.isFeatured
        }
    }

    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmaks,
            by: { $0.category.rawValue }
        )
    }
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't load \(filename) from main bundle")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't parse url \(file) from main bundle")
    }

    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse data \(data) as \(T.self):\n\(error)")
    }
}

