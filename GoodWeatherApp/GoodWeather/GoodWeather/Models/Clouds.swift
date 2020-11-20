//
//  Clouds.swift
//  GoodWeather
//
//  Created by SujitAmin on 20/11/20.
//  Copyright © 2021 Sujit Amin. All rights reserved.
//

import Foundation

// MARK: - Clouds
class Clouds: Codable , ReflectedStringConvertible{
    var all: Int?

    enum CodingKeys: String, CodingKey {
        case all = "all"
    }

    init(all: Int?) {
        self.all = all
    }
}
