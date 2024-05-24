//
//  CalculatorViewModel.swift
//  ZzuYouStudy
//
//  Created by Seonwoo Kim on 5/10/24.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var result: String = "0"
    
    private var currentNumber: String = ""
    private var previousNumber: String = ""
    private var currentOperation: Operation?
    
    enum Operation {
        case add, subtract, multiply, divide, none
    }
    
    func inputNumber(_ number: String) {
        if currentNumber.count < 10 {
            currentNumber += number
            result = currentNumber
        }
    }
    
    func performOperation(_ operation: Operation) {
        if let currentOp = currentOperation, !currentNumber.isEmpty {
            calculateResult()
        }
        
        previousNumber = currentNumber
        currentNumber = ""
        currentOperation = operation
    }
    
    func calculateResult() {
        guard let currentOp = currentOperation, !currentNumber.isEmpty, !previousNumber.isEmpty else {
            return
        }
        
        let prev = Double(previousNumber) ?? 0
        let current = Double(currentNumber) ?? 0
        var calculation: Double = 0
        
        switch currentOp {
        case .add:
            calculation = prev + current
        case .subtract:
            calculation = prev - current
        case .multiply:
            calculation = prev * current
        case .divide:
            calculation = prev / current
        default:
            break
        }
        
        result = String(calculation)
        currentNumber = result
        previousNumber = ""
        currentOperation = .none
    }
    
    func clear() {
        result = "0"
        currentNumber = ""
        previousNumber = ""
        currentOperation = .none
    }
}

