//
//  ButtonModel.swift
//  ZzuYouStudy
//
//  Created by Seonwoo Kim on 5/10/24.
//

import SwiftUI


enum ButtonColor {
    case gray
    case yellow
}

enum ButtonSize {
    case number
    case function
    
    var width: CGFloat {
        switch self {
        case .number: return 50
        case .function: return 100
        }
    }
    
    var height: CGFloat {
        switch self {
        case .number: return 50
        case .function: return 100
        }
    }
}

struct ButtonModel: Hashable {
    let color: ButtonColor
    let type: String
    let size: ButtonSize
    
    static func getDummy() -> [[ButtonModel]] {
        return [
            [ButtonModel(color: .gray, type: "7", size: .number),
             ButtonModel(color: .gray, type: "8", size: .number),
             ButtonModel(color: .gray, type: "9", size: .number),
             ButtonModel(color: .yellow, type: "÷", size: .function)],
            [ButtonModel(color: .gray, type: "4", size: .number),
             ButtonModel(color: .gray, type: "5", size: .number),
             ButtonModel(color: .gray, type: "6", size: .number),
             ButtonModel(color: .yellow, type: "×", size: .function)],
            [ButtonModel(color: .gray, type: "1", size: .number),
             ButtonModel(color: .gray, type: "2", size: .number),
             ButtonModel(color: .gray, type: "3", size: .number),
             ButtonModel(color: .yellow, type: "-", size: .function)],
            [ButtonModel(color: .gray, type: "0", size: .number),
             ButtonModel(color: .gray, type: "0", size: .number),
             ButtonModel(color: .gray, type: "0", size: .number),
             ButtonModel(color: .yellow, type: "+", size: .function)],
            [ButtonModel(color: .gray, type: "C", size: .function),
             ButtonModel(color: .gray, type: "C", size: .function),
             ButtonModel(color: .gray, type: "C", size: .function),
             ButtonModel(color: .yellow, type: "=", size: .function)]
        ]
    }
    
    static func == (lhs: ButtonModel, rhs: ButtonModel) -> Bool {
        return lhs.color == rhs.color  && lhs.size == rhs.size
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(color)
        hasher.combine(size)
    }
}


