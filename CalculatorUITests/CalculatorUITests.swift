//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by rgonzalez on 6/15/17.
//  Copyright © 2017 RG. All rights reserved.
//

import XCTest

class CalculatorUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCalculatorKeyboard() {

        let app = XCUIApplication()
        app.buttons["1"].tap()
        
        let button = app.buttons["+"]
        button.tap()
        app.buttons["2"].tap()
        button.tap()
        app.buttons["3"].tap()
        button.tap()
        app.buttons["4"].tap()
        
        var operationLabel = app.staticTexts["1 + 2 + 3 + 4"].label
        XCTAssert(operationLabel == "1 + 2 + 3 + 4", "should have the operation")
        
        app.buttons["="].tap()
        
        var result = app.staticTexts["10.0"]
        XCTAssert(result.exists, "should have the result")
        
        button.tap()
        app.buttons["2"].tap()
        
        operationLabel = app.staticTexts["10.0 + 2"].label
        XCTAssert(operationLabel == "10.0 + 2", "should have the operation")
        
        app.buttons["="].tap()
        
        result = app.staticTexts["12.0"]
        XCTAssert(result.exists, "should have the result")
        
        app.buttons["AC"].tap()
        result = app.staticTexts["0"]
        XCTAssert(result.exists, "the result should have been reseted")
        
        let operation = app.staticTexts["10.0 + 2"]
        XCTAssert(!operation.exists, "the operation should have been reseted")
    }
    
}
