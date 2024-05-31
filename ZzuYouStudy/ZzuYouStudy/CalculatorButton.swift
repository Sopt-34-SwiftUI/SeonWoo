//
//  CalculatorButton.swift
//  ZzuYouStudy
//
//  Created by Seonwoo Kim on 5/10/24.
//

import SwiftUI


struct CalculatorButton: View {
    let label: String
    let color: Color
    let action: () -> Void
    
    @State private var isPressed: Bool = false
    
    var body: some View {
        Button(action: {
            withAnimation(.bouncy(duration: 0.2)) {
                isPressed = true
            }
            action()
            withAnimation(.interpolatingSpring(duration: 0.2)) {
                isPressed = false
            }
        }) {
            Text(label)
                .font(.largeTitle)
                .frame(width: isPressed ? 45 : 50, height: isPressed ? 45 : 50)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
