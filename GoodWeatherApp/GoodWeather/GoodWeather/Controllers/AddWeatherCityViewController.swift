//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Sujit Amin on 1/15/21.
//  Copyright © 2021 Sujit Amin. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    //this is not used
    private var addCityViewModel = AddCityViewModel()
    @IBOutlet weak var cityNameTextField: BindingTextField! {
        didSet {
            cityNameTextField.bind { self.addCityViewModel.city = $0 }
        }
    }
    
    @IBOutlet weak var stateTextField: BindingTextField! {
        didSet {
            stateTextField.bind { self.addCityViewModel.state = $0 }
        }
    }
    @IBOutlet weak var zipCodeTextField: BindingTextField! {
        didSet {
            zipCodeTextField.bind { self.addCityViewModel.zipCode = $0 }
        }
    }
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        print(self.addCityViewModel)
        if let city = cityNameTextField.text {
            guard let weatherURL = URL(string: APIEndPoints.baseUrl + "data/2.5/weather?q=\(city)&APPID=\(APIKey.openWeatherAPIKey)&units=imperial") else { return }

            HttpUtility.getApiData(requestUrl: weatherURL, decodingType: WeatherModel.self) { [weak self] (weatherModel, error) in
                if error != nil {
                    print("\(String(describing: error))")
                }
                if let weatherModel = weatherModel {
                    if let delegate = self?.delegate {
                        //model 
                        let weatherViewModel = WeatherViewModel(model: weatherModel)
                        delegate.addWeatherDidSave(vm: weatherViewModel)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
