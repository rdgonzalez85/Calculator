//
//  Calculator.swift
//  Calculator
//
//  Created by rgonzalez on 6/15/17.
//  Copyright © 2017 RG. All rights reserved.
//

import Foundation

struct Calculator {
    
    enum Operation {
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
    
    static var operations: Dictionary<String, Operation> = [
        "+": Operation.binaryOperation({ $0 + $1 }),
        "-": Operation.binaryOperation({ $0 - $1 }),
        "=": Operation.equals
    ]
    
    static func performOperation(_ operation: Array<String>) -> Double {
        
        var operand1: String?
        var operand2: String?
        var currentOperation: String?
        
        for operand in operation {
            if operand1 == nil {
                operand1 = operand
            } else if currentOperation == nil {
                currentOperation = operand
            } else if operand2 == nil {
                operand2 = operand
            }
            
            if operand1 != nil && currentOperation != nil {
                if let operationType = operations[currentOperation!] {
                    switch operationType {
                        case .unaryOperation(let function):
                            if let op1 = Double(operand1!) {
                                operand1 = String(function(op1))
                                currentOperation = nil
                            }
                        case .binaryOperation(let function):
                            if operand2 != nil {
                                if let op1 = Double(operand1!), let op2 = Double(operand2!) {
                                    operand1 = String(function(op1,op2))
                                    operand2 = nil
                                    currentOperation = nil
                                }
                            }
                        
                        case .equals:
                            if let op1 = Double(operand1!) {
                                return op1
                            } else {
                                return 0.0
                            }
                    }
                }
            }
            
        }
        
        return 0.0
    }
}
