//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by rgonzalez on 6/15/17.
//  Copyright © 2017 RG. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    let calculator = Calculator()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCalculatorAddition() {
        let operations = ["1","+","2","+","3","+","4","="]
        let result = Calculator.performOperation(operations)
        XCTAssert(result == 10.0)
    }
    
    func testCalculatorSubstraction() {
        let operations = ["5","-","3","-","1","-","1","="]
        let result = Calculator.performOperation(operations)
        XCTAssert(result == 0.0)
    }
    
    func testAdditionNegativeNumbers() {
        let operations = ["-1","+","2","+","-3","+","4","="]
        let result = Calculator.performOperation(operations)
        XCTAssert(result == 2.0)
    }

    func testSubstractionNegativeNumbers() {
        let operations = ["1","-","-2","-","-3","-","4","="]
        let result = Calculator.performOperation(operations)
        XCTAssert(result == 2.0)
    }

    func testAdditionSubstractionWithNegativeNumbers() {
        let operations = ["1","+","-2","-","3","+","4","-","1","="]
        let result = Calculator.performOperation(operations)
        XCTAssert(result == -1.0)
    }
    
    func testAdditionDecimalNumbers() {
        let operations = ["1.5","+","1.1","="]
        let result = Calculator.performOperation(operations)
        XCTAssert(result == 2.6)
    }
    
    func testSubstractionDecimalNumbers() {
        let operations = ["1.5","-","1.1","="]
        let result = Calculator.performOperation(operations)
        XCTAssert(result == 0.4)
    }
    
    func testAdditionSubstractionWithNegativeDecimalNumbers() {
        let operations = ["1.2","+","-2.1","-","3.7","+","4.3","-","1.5","="]
        let result = Calculator.performOperation(operations)
        XCTAssert(result == -1.8)
    }

    func testAdditionNotNumber() {
        let operations = ["a","="]
        let result = Calculator.performOperation(operations)
        XCTAssert(result == 0.0)
    }
}
