//
//  RouterProtocol.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 07.08.2022.
//

import UIKit

protocol RouterProtocol {    
    func initialViewConroller()
    func creatorModule(editTask: Task?)
    func popToRoot()
}
