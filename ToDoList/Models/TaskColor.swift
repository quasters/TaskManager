//
//  TaskColor.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 12.08.2022.
//

import UIKit

enum TaskColor: String, CaseIterable {
    case yellow = "Yellow"
    case green = "Green"
    case blue = "Blue"
    case purple = "Purple"
    case orange = "Orange"
    case red = "Red"
    
    init(colorId: Int) {
        switch colorId {
        case 0: self = .yellow
        case 1: self = .green
        case 2: self = .blue
        case 3: self = .purple
        case 4: self = .orange
        case 5: self = .red
        default: self = .yellow
        }
    }
    
//    static func getName(by colorId: Int) -> String {
//        switch colorId {
//        case 0: return "Yellow"
//        case 1: return "Green"
//        case 2: return "Blue"
//        case 3: return "Purple"
//        case 4: return "Orange"
//        case 5: return "Red"
//        default: return "Yellow"
//        }
//    }
    
    func getColor() -> UIColor {
        switch self {
        case .yellow:
            return .yellow
        case .green:
            return .systemMint
        case .blue:
            return .systemCyan
        case .purple:
            let color = #colorLiteral(red: 0.9422228345, green: 0.6805697546, blue: 1, alpha: 1)
            return color
        case .orange:
            let color = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            return color
        case .red:
            let color = #colorLiteral(red: 1, green: 0.5, blue: 0.3539223673, alpha: 1)
            return color
        }
    }
}
