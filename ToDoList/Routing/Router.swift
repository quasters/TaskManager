//
//  Router.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 07.08.2022.
//

import UIKit

class Router: RouterProtocol {
    private var navController: UINavigationController?
    private var builder: AsselderBuilder?
    
    init(navController: UINavigationController, builder: AsselderBuilder) {
        self.navController = navController
        self.builder = builder
    }
    
    func initialViewConroller() {
        if let navController = navController {
            guard let creatorVC = builder?.createCreatorModule(router: self) else { return }
            navController.pushViewController(creatorVC, animated: true)
        }
//        if let navController = navController {
//            guard let mainVC = builder?.createMainModule(router: self) else { return }
//            navController.viewControllers = [mainVC]
//        }
    }
    
    func creatorModule() {
        if let navController = navController {
            guard let creatorVC = builder?.createCreatorModule(router: self) else { return }
            navController.pushViewController(creatorVC, animated: true)
        }
    }
    
    func popToRoot() {
        if let navController = navController {
            navController.popToRootViewController(animated: true)
        }
    }
}
