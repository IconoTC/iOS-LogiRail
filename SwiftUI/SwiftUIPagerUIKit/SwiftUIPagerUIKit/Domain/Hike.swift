//
//  Hike.swift
//  SwiftUIPagerUIKit
//
//  Created by David Jardon on 1/12/23.
//

import Foundation


struct Hike: Codable, Hashable, Identifiable {
    static var formatter = LengthFormatter()

    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]

    var distanceText: String {
        Hike.formatter.string(
            fromValue: distance,
            unit: .kilometer
        )
    }

    struct Observation: Codable, Hashable {
        var distanceFromStart: Double
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
