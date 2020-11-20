//
//  Wind.swift
//  GoodWeather
//
//  Created by SujitAmin on 20/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

// MARK: - Wind
class Wind: Codable, ReflectedStringConvertible {
    var speed: Double?
    var deg: Int?

    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
    }

    init(speed: Double?, deg: Int?) {
        self.speed = speed
        self.deg = deg
    }
}
