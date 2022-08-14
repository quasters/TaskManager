//
//  Coordinator.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 07.08.2022.
//

import UIKit

protocol AsselderBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createCreatorModule(router: RouterProtocol, editTask: Task?) -> UIViewController
}

