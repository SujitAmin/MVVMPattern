//
//  Sys.swift
//  GoodWeather
//
//  Created by SujitAmin on 20/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class Sys: Codable , ReflectedStringConvertible{
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }

    init(type: Int?, id: Int?, country: String?, sunrise: Int?, sunset: Int?) {
        self.type = type
        self.id = id
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
}
