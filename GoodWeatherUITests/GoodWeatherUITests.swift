//
//  GoodWeatherUITests.swift
//  GoodWeatherUITests
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import XCTest

class GoodWeatherUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
           continueAfterFailure = false
           app.launch()
       }

       override func tearDownWithError() throws {
           app.uninstall()
       }
    
    
    func testRefteshForecastForCity() throws {
        let city = "Berlin"
        app.images["settings"].tap()
        let cityTextField = app.textFields.firstMatch
        cityTextField.clear()
        cityTextField.typeText(city)
        app.buttons["close"].tap()
        sleep(3)
        XCTAssertEqual(city, app.staticTexts["city"].label)
      
    }
    
}

extension XCUIElement {
    
    func clear() {
        guard let value = self.value as? String else {
            return
        }
        tap()
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: value.count)
        typeText(deleteString)
    }
    
}

extension XCUIApplication {

    func uninstall(name: String? = nil) {
        self.terminate()
        
        let timeout = TimeInterval(5)
        let springboard = XCUIApplication(bundleIdentifier: "Inbright--ukasz-Andrzejewski.GoodWeather")

        let appName: String
        if let name = name {
            appName = name
        } else {
            let uiTestRunnerName = Bundle.main.infoDictionary?["CFBundleName"] as! String
            appName = uiTestRunnerName.replacingOccurrences(of: "UITests-Runner", with: "")
        }

        /// use `firstMatch` because icon may appear in iPad dock
        let appIcon = springboard.icons[appName].firstMatch
        if appIcon.waitForExistence(timeout: timeout) {
            appIcon.press(forDuration: 2)
        } else {
            XCTFail("Failed to find app icon named \(appName)")
        }

        let removeAppButton = springboard.buttons["Remove App"]
        if removeAppButton.waitForExistence(timeout: timeout) {
            removeAppButton.tap()
        } else {
            XCTFail("Failed to find 'Remove App'")
        }

        let deleteAppButton = springboard.alerts.buttons["Delete App"]
        if deleteAppButton.waitForExistence(timeout: timeout) {
            deleteAppButton.tap()
        } else {
            XCTFail("Failed to find 'Delete App'")
        }

        let finalDeleteButton = springboard.alerts.buttons["Delete"]
        if finalDeleteButton.waitForExistence(timeout: timeout) {
            finalDeleteButton.tap()
        } else {
            XCTFail("Failed to find 'Delete'")
        }
    }
    
}
