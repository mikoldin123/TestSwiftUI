//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Michael Dean Villanda on 8/20/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import SwiftUI

enum Samples: Int {
    case calculator = 0
    case dynamicList = 1
    
    var title: String {
        switch self {
        case .calculator:
            return "CALCULATOR"
        default:
            return "DYNAMIC LIST"
        }
    }
    
    var view: AnyView? {
        switch self {
        case .calculator:
            return AnyView(CalculatorView())
        default:
            return AnyView(TableView())
        }
    }
}

extension Samples: Identifiable {
    var id: Int { self.rawValue }
}

struct ContentView: View {
    let samples: [Samples] = [.calculator, .dynamicList]
    
    var body: some View {
        NavigationView {
            List(samples) { sample in
                NavigationLink(destination: sample.view) {
                    Text(sample.title)
                }
            }.navigationBarTitle("Sample Views")
        }.padding(.vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(KeyField())
    }
}

extension String {
    var toFloat: Float {
        return (self as NSString).floatValue
    }
}
