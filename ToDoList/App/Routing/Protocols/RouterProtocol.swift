//
//  RouterProtocol.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 07.08.2022.
//

import UIKit

protocol RouterProtocol {
    var navController: UINavigationController? { get set }
    var builder: AsselderBuilder? { get set }
    
    func initialViewConroller()
    func editModule()
    func popToRoot()
}
