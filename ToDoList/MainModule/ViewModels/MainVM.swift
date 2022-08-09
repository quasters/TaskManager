//
//  MainVM.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 06.08.2022.
//

import Foundation

protocol MainVMProtocol {
    func swiftchToCreatorModule()
}

class MainVM: MainVMProtocol {
    private var router: RouterProtocol?
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func swiftchToCreatorModule() {
        router?.creatorModule()
    }
}
