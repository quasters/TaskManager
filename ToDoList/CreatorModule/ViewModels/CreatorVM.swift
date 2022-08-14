//
//  CreatorVM.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 08.08.2022.
//

import RxSwift
import RxCocoa

protocol CreatorVMProtocol {
    var isEditing: Bool { get }
    func save(title: String, type: TypeTab, deadline: Date, color: TaskColor)
    func popToRoot()
}

final class CreatorVM: CreatorVMProtocol {
    private var router: RouterProtocol?
    var isEditing = false
    
    private let dataProvider: DataProvider = DataStoreManager.shared
    
    init(router: RouterProtocol, isEditing: Bool) {
        self.router = router
        self.isEditing = isEditing
    }
    
    func save(title: String, type: TypeTab, deadline: Date, color: TaskColor) {
        dataProvider.saveNewTask(title: title, type: type, deadline: deadline, color: color)
    }
    
    func popToRoot() {
        router?.popToRoot()
    }
}
