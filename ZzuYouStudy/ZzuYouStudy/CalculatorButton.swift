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
    
    
    var body: some View {
        Button(action: {
            // 버튼 클릭 시 동작 추가
        }) {
            Text("\(label)")
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(color)
                .cornerRadius(25)
        }
    }
}
