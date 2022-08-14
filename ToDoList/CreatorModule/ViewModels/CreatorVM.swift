//
//  CreatorVM.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 08.08.2022.
//

import RxSwift
import RxCocoa

protocol CreatorVMProtocol {
    var editTask: Task? { get }
    func save(title: String, type: TypeTab, deadline: Date, color: TaskColor)
    func update(task: Task, title: String, type: TypeTab, deadline: Date, color: TaskColor)
    func delete(task: Task)
    func popToRoot()
}

final class CreatorVM: CreatorVMProtocol {
    private var router: RouterProtocol?
    var editTask: Task? = nil
    
    private let dataProvider: DataProvider = DataStoreManager.shared
    
    init(router: RouterProtocol, editTask: Task?) {
        self.router = router
        self.editTask = editTask
    }
    
    func save(title: String, type: TypeTab, deadline: Date, color: TaskColor) {
        dataProvider.saveNewTask(title: title, type: type, deadline: deadline, color: color)
    }
    
    func update(task: Task, title: String, type: TypeTab, deadline: Date, color: TaskColor) {
        dataProvider.updateTask(task: task, title: title, type: type, deadline: deadline, color: color, isCompleted: nil)
    }
    
    func delete(task: Task) {
        dataProvider.deleteTask(task: task)
    }
    
    func popToRoot() {
        router?.popToRoot()
    }
}
