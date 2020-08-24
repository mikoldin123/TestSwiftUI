//
//  CalculatorKeys.swift
//  TestSwiftUI
//
//  Created by Michael Dean Villanda on 8/20/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import SwiftUI

enum CalculatorKeys: String {
    case zero = "0", one = "1", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9", decimal = "."
    case equals = "=", plus = "+", minus = "-", multiply = "x", divide = "/"
    case reset = "AC", negPos = "+/-", percent = "%"
    
    private var suggestedSize: CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
    var width: CGFloat {
        switch self {
        case .zero:
            return suggestedSize * 2
        default:
            return suggestedSize
        }
    }
    
    var height: CGFloat {
        return suggestedSize
    }
    
    var color: Color {
        switch self {
        case .reset, .negPos, .percent:
            return Color(.lightGray)
        case .equals, .plus, .minus, .multiply, .divide:
            return Color(.orange)
        default:
            return Color(.gray)
        }
    }
}
