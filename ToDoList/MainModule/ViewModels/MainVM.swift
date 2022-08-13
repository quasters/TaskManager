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
    func swiftchToCreatorModule()
    func updateTasks(currentTab: MainTab)
}

final class MainVM: MainVMProtocol {
    private var router: RouterProtocol?
    
    let tasks = PublishSubject<[Task]?>()
    let disposeBag = DisposeBag()
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func updateTasks(currentTab: MainTab) {
        let data = DataStoreManager.shared.getTasks(currentTab: currentTab)
        tasks.onNext(data)
    }
    
    func swiftchToCreatorModule() {
        router?.creatorModule()
    }
}
