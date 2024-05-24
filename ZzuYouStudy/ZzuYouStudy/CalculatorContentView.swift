
//
//  ContentView.swift
//  ZzuYouStudy
//
//  Created by Seonwoo Kim on 5/10/24.
//

import SwiftUI


struct CalculatorContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    
    var body: some View {
        VStack {
            ResultView(result: $viewModel.result)
            GridView(viewModel: viewModel)
        }
    }
}

private struct ResultView: View {
    @Binding var result: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(result)
                .font(.largeTitle)
                .padding()
        }
    }
}

private struct GridView: View {
    @ObservedObject var viewModel: CalculatorViewModel
    
    let buttons = ButtonModel.getDummy()
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(buttons.indices, id: \.self) { rowIndex in
                HStack(spacing: 10) {
                    CalculatorButton(label: buttons[rowIndex][0].type, color: buttons[rowIndex][0].color == .gray ? .gray : .yellow, action: {
                        handleButtonTap(button: buttons[rowIndex][0])
                    })
                    CalculatorButton(label: buttons[rowIndex][1].type, color: buttons[rowIndex][1].color == .gray ? .gray : .yellow, action: {
                        handleButtonTap(button: buttons[rowIndex][1])
                    })
                    CalculatorButton(label: buttons[rowIndex][2].type, color: buttons[rowIndex][2].color == .gray ? .gray : .yellow, action: {
                        handleButtonTap(button: buttons[rowIndex][2])
                    })
                    CalculatorButton(label: buttons[rowIndex][3].type, color: buttons[rowIndex][3].color == .gray ? .gray : .yellow, action: {
                        handleButtonTap(button: buttons[rowIndex][3])
                    })
                }
            }
        }
        .padding()
    }
    
    private func handleButtonTap(button: ButtonModel) {
        switch button.type {
        case "0"..."9":
            viewModel.inputNumber(button.type)
        case "+":
            viewModel.performOperation(.add)
        case "-":
            viewModel.performOperation(.subtract)
        case "×":
            viewModel.performOperation(.multiply)
        case "÷":
            viewModel.performOperation(.divide)
        case "=":
            viewModel.calculateResult()
        case "C":
            viewModel.clear()
        default:
            break
        }
    }
}


