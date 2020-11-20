//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Sujit Amin on 1/15/21.
//  Copyright © 2021 Sujit Amin. All rights reserved.
//

import Foundation

extension Double {
    var formatAsDegree: String {
        return String(format: "%.0f°",self)
    }
}
