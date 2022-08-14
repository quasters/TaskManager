//
//  AsselderBuilder.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 07.08.2022.
//

import UIKit

class AsselderBuilder: AsselderBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let viewModel = MainVM(router: router)
        let viewController = MainVC()
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createCreatorModule(router: RouterProtocol, isEditing: Bool) -> UIViewController  {
        let viewModel = CreatorVM(router: router, isEditing: isEditing)
        let viewController = CreatorVC()
        viewController.viewModel = viewModel
        return viewController
    }
}
