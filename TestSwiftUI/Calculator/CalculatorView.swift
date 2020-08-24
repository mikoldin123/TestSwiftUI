//
//  CalculatorView.swift
//  TestSwiftUI
//
//  Created by Michael Dean Villanda on 8/20/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import SwiftUI

struct CalculatorView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black
            KeyPad()
        }.navigationBarTitle("Calculator")
    }
}

struct KeyPad: View {
    
    @EnvironmentObject var keyField: KeyField
    
    let buttons: [[CalculatorKeys]] = [
        [.reset, .negPos, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Spacer()
                Text(keyField.display).foregroundColor(.white).font(.system(size: 64))
            }.padding()
            
            ForEach(buttons, id: \.self) { row in
                HStack (spacing: 12) {
                     ForEach(row, id: \.self) { button in
                        KeyItem(button: button)
                     }
                }
            }.padding(.bottom)
        }
    }
}

struct KeyItem: View {
    var button: CalculatorKeys
    
    @EnvironmentObject var keyField: KeyField
    
    var body: some View {
        Button(action: {
            self.keyField.keyPress(self.button)
        }) {
            Text(button.rawValue)
                .font(.system(size: 32))
                .frame(width: button.width, height: button.height)
                .foregroundColor(.white)
                .background(button.color)
                .cornerRadius(button.height)
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView().environmentObject(KeyField())
        CalculatorView().environmentObject(KeyField())
    }
}
