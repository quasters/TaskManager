//
//  TypeTab.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 13.08.2022.
//

import Foundation

enum TypeTab: String {
    case basic = "Basic"
    case urgent = "Urgent"
    case important = "Important"
    
    init(typeId: Int) {
        switch typeId {
        case 0: self = .basic
        case 1: self = .urgent
        case 2: self = .important
        default: self = .basic
        }
    }
}
