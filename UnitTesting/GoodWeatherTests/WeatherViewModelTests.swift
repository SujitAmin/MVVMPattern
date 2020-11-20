//
//  WeatherViewModelTests.swift
//  GoodWeatherTests
//
//  Created by SujitAmin on 20/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import XCTest
@testable import GoodWeather

class WeatherViewModelTests: XCTestCase {
    private var weatherListVM : WeatherListViewModel!
    override func setUp() {
        super.setUp();
        self.weatherListVM = WeatherListViewModel()
        
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(name: "Houston", currentTemperature: TemperatureViewModel(temperature: 32, temperatureMin: 0, temperatureMax: 0)))
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(name: "Denver", currentTemperature: TemperatureViewModel(temperature: 72, temperatureMin: 0, temperatureMax: 0)))
    }
    
    func test_should_be_able_to_convert_to_celsius_successfully() {
        let celsiusTemp = [0, 22.222]
        self.weatherListVM.updateUnit(to: .celsius)
        for (index, vm) in self.weatherListVM.weatherViewModels.enumerated() {
            XCTAssertEqual(round(vm.currentTemperature.temperature), round(celsiusTemp[index]))
        }
    }
    
    override func tearDown() {
        super.tearDown();
    }
}
