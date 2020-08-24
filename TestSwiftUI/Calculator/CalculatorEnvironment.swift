//
//  CalculatorEnvironment.swift
//  TestSwiftUI
//
//  Created by Michael Dean Villanda on 8/20/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import SwiftUI

class KeyField: ObservableObject {
    @Published var display = ""
    
    var operand: CalculatorKeys = .equals
    var firstInput: String = ""
    var lastInput: String = ""
    
    var hasOperand: Bool = false
    
    func keyPress(_ key: CalculatorKeys) {
        
        switch key {
        case .divide, .plus, .multiply, .minus:
            
            hasOperand = true
            self.operand = key
            
            if !self.firstInput.isEmpty && !self.lastInput.isEmpty {
                calculate()
                return
            }
        case .equals:
            
            if !self.firstInput.isEmpty && !self.lastInput.isEmpty {
                calculate()
                return
            }
        case .reset:
            
            self.display = ""
            self.firstInput = ""
            self.lastInput = ""
            self.operand = .reset
        default:
            
            if hasOperand {
                self.display = ""
                hasOperand = false
            }
            

            self.display = display + key.rawValue
        }
    }
    
    func calculate() {
        let first = firstInput.toFloat
        let last = lastInput.toFloat
        
        switch operand {
        case .divide:
            self.display = "\(first / last)"
        case .multiply:
            self.display = "\(first * last)"
        case .minus:
            self.display = "\(first - last)"
        default:
            print("\(first) plus \(last)")
            self.display = "\(first + last)"
        }
        
        self.firstInput = self.display
        self.lastInput = ""
        self.display = ""
    }
}
