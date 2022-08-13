//
//  CreatorVM.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 08.08.2022.
//

import RxSwift
import RxCocoa

protocol CreatorVMProtocol {
    func savePopToRoot(title: String, type: TypeTab, date: Date, color: TaskColor)
}

final class CreatorVM: CreatorVMProtocol {
    private var router: RouterProtocol?
    
    init(router: RouterProtocol) {
        
    }
    
    func savePopToRoot(title: String, type: TypeTab, date: Date, color: TaskColor) {
        
    }
}
