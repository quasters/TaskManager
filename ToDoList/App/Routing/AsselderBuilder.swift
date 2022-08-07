//
//  AsselderBuilder.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 07.08.2022.
//

import UIKit

class AsselderBuilder: AsselderBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let viewModel = MainVM()
        let viewController = MainVC()
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createEditModule(router: RouterProtocol) -> UIViewController  {
        
        return UIViewController()
    }
}
