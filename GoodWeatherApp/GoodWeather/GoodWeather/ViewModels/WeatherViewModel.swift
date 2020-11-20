//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by SujitAmin on 20/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

struct WeatherViewModel {
    var model : WeatherModel?
    init(model : WeatherModel) {
        self.model = model
    }
    //var name: String;
    func getName() -> String {
        return model?.name ?? ""
    }
    func getCurrentTemperature() -> Double {
        if let temperature = (model?.main?.temp) {
            return temperature
        }
        return 0.0
    }
    func setCurrentTemperature(_ temperature : Double) {
        self.model?.main?.temp = temperature;
    }
}
