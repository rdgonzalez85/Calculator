//
//  CalculatorPresenter.swift
//  Calculator
//
//  Created by rgonzalez on 6/15/17.
//  Copyright © 2017 RG. All rights reserved.
//

import Foundation

protocol CalculatorPresenterDelegate: class {
    func newOperationAdded(operation: String?)
    func operationResult(result: String)
}

struct CalculatorPresenter {
    
    weak var delegate: CalculatorPresenterDelegate?
    
    private var operations = Array<String>()
    private var digits = Array<String>()
    private let calculator = Calculator()
    
    private let equalsOperation = "="
    private let decimal = "."
    
    private var hasDecimal = false
    mutating func addDigit(_ digit: String) {
        if digit == decimal {
            if !hasDecimal {
                hasDecimal = true
                digits.append(digit)
            }
        } else {
            digits.append(digit)
        }
        
        delegate?.newOperationAdded(operation: operationsString())
    }
    
    mutating func addOperation(_ operation: String) {
        if digits.count > 0 {
            operations.append(digits.joined())
            digits = Array<String>()
            hasDecimal = false
        }
       
        operations.append(operation)
        if operation == equalsOperation {
            let result = Calculator.performOperation(operations)
            if result != 0.0 {
                digits = [String(result)]
            }
            operations = []
            delegate?.operationResult(result: String(result))
        }
        
        delegate?.newOperationAdded(operation: operationsString())
    }
    
    mutating func clear() {
        digits = Array<String>()
        operations = Array<String>()
        hasDecimal = false
        delegate?.newOperationAdded(operation: operationsString())
        delegate?.operationResult(result: String(0))
    }
    
    private func operationsString() -> String? {
        let operationsString = operations.joined(separator: " ") + " " + digits.joined()
        return operationsString
    }
    
}
