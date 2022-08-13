//
//  MainTab.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 13.08.2022.
//

import Foundation

enum MainTab: String {
    case today = "Today"
    case upcoming = "Upcoming"
    case done = "Task Done"
    case fail = "Failed"
    
    init(id: Int) {
        switch id {
        case 0: self = .today
        case 1: self = .upcoming
        case 2: self = .done
        case 3: self = .fail
        default: self = .today
        }
    }
}
