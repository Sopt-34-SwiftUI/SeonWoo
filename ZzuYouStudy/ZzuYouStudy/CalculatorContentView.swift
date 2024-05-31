
//
//  ContentView.swift
//  ZzuYouStudy
//
//  Created by Seonwoo Kim on 5/10/24.
//

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
                    ForEach(buttons[rowIndex], id: \.type) { button in
                        CalculatorButton(label: button.type, color: button.color == .gray ? .gray : .yellow, action: {
                            handleButtonTap(button: button)
                        })
                    }
                }
            }
        }
        .padding()
    }
    
    private func handleButtonTap(button: ButtonModel) {
        withAnimation(.easeInOut(duration: 0.2)) {
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
}

