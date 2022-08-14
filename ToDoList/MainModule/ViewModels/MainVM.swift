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
    
    func swiftchToCreatorModule(editTask: Task? = nil) {
        router?.creatorModule(editTask: editTask)
    }
}
