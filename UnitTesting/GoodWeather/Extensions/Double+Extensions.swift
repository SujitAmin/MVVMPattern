//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Mohammad Azam on 12/2/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation

extension Double {
    
    var formatAsDegree: String {
        return String(format: "%.0f°",self)
    }
    
}
