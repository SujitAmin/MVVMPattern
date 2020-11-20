//
//  Coord.swift
//  GoodWeather
//
//  Created by SujitAmin on 20/11/20.
//  Copyright © 2021 Sujit Amin. All rights reserved.
//

import Foundation

class Coord: Codable, ReflectedStringConvertible {
    var lon: Double?
    var lat: Double?

    enum CodingKeys: String, CodingKey {
        case lon = "lon"
        case lat = "lat"
    }

    init(lon: Double?, lat: Double?) {
        self.lon = lon
        self.lat = lat
    }
}
