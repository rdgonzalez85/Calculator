//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by rgonzalez on 6/15/17.
//  Copyright © 2017 RG. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func digitTapped(_ sender: UIButton) {
        guard let digit = sender.currentTitle else {
            return
        }
        
        presenter.addDigit(digit)
    }
   
    @IBAction func operationTapped(_ sender: UIButton) {
        guard let operation = sender.currentTitle else {
            return
        }
        
        presenter.addOperation(operation)
    }
   
    @IBAction func clearTapped(_ sender: Any) {
        presenter.clear()
    }
    
    private(set) lazy var presenter: CalculatorPresenter  = self.createPresenter()
    
    private func createPresenter() -> CalculatorPresenter {
        var calculatorPresenter = CalculatorPresenter()
        calculatorPresenter.delegate = self
        return calculatorPresenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
}


extension CalculatorViewController: CalculatorPresenterDelegate {
    func newOperationAdded(operation: String?) {
        displayLabel.text = operation
    }
    func operationResult(result: String) {
        resultLabel.text = result
    }
}
