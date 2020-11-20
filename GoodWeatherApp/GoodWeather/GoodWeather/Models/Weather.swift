//
//  Weather.swift
//  GoodWeather
//
//  Created by SujitAmin on 20/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

// MARK: - Weather
class Weather: Codable, ReflectedStringConvertible {
    var id: Int?
    var main: String?
    var weatherDescription: String?
    var icon: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case weatherDescription = "description"
        case icon = "icon"
    }

    init(id: Int?, main: String?, weatherDescription: String?, icon: String?) {
        self.id = id
        self.main = main
        self.weatherDescription = weatherDescription
        self.icon = icon
    }
}
