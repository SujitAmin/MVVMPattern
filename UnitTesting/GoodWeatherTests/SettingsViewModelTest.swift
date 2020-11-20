//
//  SettingsViewModelTest.swift
//  GoodWeatherTests
//
//  Created by SujitAmin on 20/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import XCTest
@testable import GoodWeather

class SettingsViewModelTest: XCTestCase {
    private var settingsVM : SettingsViewModel!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        self.settingsVM = SettingsViewModel()
    }

    func test_should_return_correct_display_name_for_farhenheit() {
        XCTAssertEqual(self.settingsVM.selectedUnit.displayName, "Fahrenheit")
    }
    
    func test_should_make_sure_that_default_selected_unit_is_F() {
        XCTAssertEqual(settingsVM.selectedUnit, Unit.fahrenheit)
    }
    
    func test_should_be_able_to_save_user_unit_selection() {
        self.settingsVM.selectedUnit = .celsius;
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }
    override func tearDown() {
        super.tearDown()
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }
}
