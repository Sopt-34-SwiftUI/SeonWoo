
//
//  ContentView.swift
//  ZzuYouStudy
//
//  Created by Seonwoo Kim on 5/10/24.
//

import SwiftUI


struct CalculatorContentView: View {
    var body: some View {
        VStack {
            GridView()
        }
    }
}


private func GridView() -> some View {
    let buttons = ButtonModel.getDummy()
    
    return VStack(spacing: 10) {
        ForEach(buttons.indices, id: \.self) { rowIndex in
            HStack(spacing: 10) {
                CalculatorButton(label: buttons[rowIndex][0].type, color: buttons[rowIndex][0].color == .gray ? .gray : .yellow)
                CalculatorButton(label: buttons[rowIndex][1].type, color: buttons[rowIndex][1].color == .gray ? .gray : .yellow)
                CalculatorButton(label: buttons[rowIndex][2].type, color: buttons[rowIndex][2].color == .gray ? .gray : .yellow)
                CalculatorButton(label: buttons[rowIndex][3].type, color: buttons[rowIndex][3].color == .gray ? .gray : .yellow)
            }
        }
    }
    .padding()
}

