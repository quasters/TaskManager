//
//  DataFetcher.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 14.08.2022.
//

import Foundation

protocol DataProvider {
    func getTasks(currentTab: MainTab) -> [Task]?
    func saveNewTask(title: String, type: TypeTab, deadline: Date, color: TaskColor)
    func updateTask(task: Task, title: String?, type: TypeTab?, deadline: Date?, color: TaskColor?, isCompleted: Bool?)
}

