//
//  Router.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 07.08.2022.
//

import UIKit

class Router: RouterProtocol {
    var navController: UINavigationController?
    var builder: AsselderBuilder?
    
    init(navController: UINavigationController, builder: AsselderBuilder) {
        self.navController = navController
        self.builder = builder
    }
    
    func initialViewConroller() {
        if let navController = navController {
            guard let mainVC = builder?.createMainModule(router: self) else { return }
            navController.viewControllers = [mainVC]
        }
    }
    
    func editModule() {
        
    }
    
    func popToRoot() {
        if let navController = navController {
            navController.popToRootViewController(animated: true)
        }
    }
}