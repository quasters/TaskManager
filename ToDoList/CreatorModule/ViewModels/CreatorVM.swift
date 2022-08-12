//
//  CreatorVM.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 08.08.2022.
//

import RxSwift
import RxCocoa

protocol CreatorVMProtocol {
    var editedTaskObserver: PublishSubject<Task> { get }
}

final class CreatorVM: CreatorVMProtocol {
    var editedTaskObserver = PublishSubject<Task>()
    
    private func saveAndGo() {
        editedTaskObserver.bind { [weak self] task in
            return
        }
    }
    
}
