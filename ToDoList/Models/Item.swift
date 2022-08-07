//
//  Item.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 06.08.2022.
//

import Foundation

struct Item {
    var title: String
    var isDone: Bool = false
    
    var childItems: [Item]?
}
