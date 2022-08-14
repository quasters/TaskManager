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
    
    func getColor() -> UIColor {
        switch self {
        case .yellow:
            return #colorLiteral(red: 0.9557898672, green: 0.9359652029, blue: 0.05191622707, alpha: 1)
        case .green:
            return #colorLiteral(red: 0, green: 0.7812903523, blue: 0.7460705638, alpha: 1)
        case .blue:
            return #colorLiteral(red: 0.1962621808, green: 0.6769673824, blue: 0.9034142494, alpha: 1)
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
