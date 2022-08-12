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
    
    mutating func setColor(with color: String) {
        switch color {
        case "Yellow":
            self = .yellow
        case "Green":
            self = .green
        case "Blue":
            self = .blue
        case "Purple":
            self = .purple
        case "Orange":
            self = .orange
        case "Red":
            self = .red
        default: return
        }
    }
}
