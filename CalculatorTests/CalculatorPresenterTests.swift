//
//  CalculatorPresenter.swift
//  Calculator
//
//  Created by rgonzalez on 6/16/17.
//  Copyright © 2017 RG. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorPresenterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformAddition() {
        var presenter = CalculatorPresenter()
        let delegate = CalculatorPresenterMockDelegate()
        presenter.delegate = delegate
        presenter.addDigit("1")
        presenter.addOperation("+")
        presenter.addDigit("2")
        presenter.addOperation("+")
        presenter.addDigit("3")
        presenter.addOperation("+")
        presenter.addDigit("4")
        presenter.addOperation("=")
        
        XCTAssert(delegate.isOperationAdded == true, "CalculatorPresenterDelegate newOperationAdded should have been called")
        XCTAssert(delegate.isOperationResult == true , "CalculatorPresenterDelegate operationResult should have been called")
    }
    
}

class CalculatorPresenterMockDelegate: CalculatorPresenterDelegate {
    var isOperationAdded = false
    var isOperationResult = false
    
    func newOperationAdded(operation: String?) {
        isOperationAdded = true
    }
    func operationResult(result: String) {
        isOperationResult = true
    }
}
