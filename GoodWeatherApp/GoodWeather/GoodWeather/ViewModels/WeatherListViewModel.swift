//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Sujit Amin on 1/15/21.
//  Copyright © 2021 Sujit Amin. All rights reserved.
//

import Foundation

class WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index: Int, _ section : Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
    }
    
    private func toCelsius() {
       weatherViewModels = weatherViewModels.map { vm in
        let weatherModel = vm
        weatherModel.setCurrentTemperature((weatherModel.getCurrentTemperature() - 32) * 5/9);
            return weatherModel
        }
    }
    
    private func toFahrenheit() {
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
        weatherModel.setCurrentTemperature((weatherModel.getCurrentTemperature()  * 9/5) + 32);
            return weatherModel
            
        }
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
            case .celsius:
                toCelsius()
            case .fahrenheit:
                toFahrenheit()
        }
    }
    
}

