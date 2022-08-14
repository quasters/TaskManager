//
//  MainVM.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 06.08.2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol MainVMProtocol {
    var tasks: PublishSubject<[Task]?> { get }
    func swiftchToCreatorModule(editTask: Task?)
    func updateTasks(currentTab: MainTab)
    func updateTask(task: Task, isCompleted: Bool)
}

final class MainVM: MainVMProtocol {
    private var router: RouterProtocol?
    private var dataProvider: DataProvider = DataStoreManager.shared
    
    let tasks = PublishSubject<[Task]?>()
    let disposeBag = DisposeBag()
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func updateTasks(currentTab: MainTab) {
        let data = dataProvider.getTasks(currentTab: currentTab)
        tasks.onNext(data)
    }
    
    func updateTask(task: Task, isCompleted: Bool) {
        dataProvider.updateTask(task: task, title: nil, type: nil, deadline: nil, color: nil, isCompleted: isCompleted)
    }
    
    func swiftchToCreatorModule(editTask: Task? = nil) {
        router?.creatorModule(editTask: editTask)
    }
}
