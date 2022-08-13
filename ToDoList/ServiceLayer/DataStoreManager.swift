//
//  DataStoreManager.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 12.08.2022.
//

import Foundation
import CoreData

class DataStoreManager {
    static let shared = DataStoreManager()
    private init(){}
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    lazy var viewContext = persistentContainer.viewContext
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
//    
//    func defaultValue() -> Task {
//        let task = Task(context: viewContext)
//        task.color = TaskColor.yellow.rawValue
//        task.deadline = Date.now
//        task.isCompleted = true
//        task.title = "Test2"
//        task.type = "Basic"
//        
//        do {
//            try viewContext.save()
//        } catch let error {
//            print(error)
//        }
//        
//        return task
//    }
    
    func getTasks(currentTab: MainTab) -> [Task]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        let calendar = Calendar.current
        
        switch currentTab {
        case .today:
            let today = calendar.startOfDay(for: Date())
            let tommorow = calendar.date(byAdding: .day, value: 1, to: today)!
            
            let filterKey = "deadline"
            
            fetchRequest.predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) < %@ AND isCompleted = False",
                                                 argumentArray: [today, tommorow])
        case .upcoming:
            let tommorow = calendar.startOfDay(for: calendar.date(byAdding: .day, value: 1, to: Date())!)
            let future = Date.distantFuture
            
            let filterKey = "deadline"
            
            fetchRequest.predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) < %@ AND isCompleted = False",
                                                 argumentArray: [tommorow, future])
        case .done:
            fetchRequest.predicate = NSPredicate(format: "isCompleted = True")
        case .fail:
            let today = calendar.startOfDay(for: Date())
            
            let filterKey = "deadline"
            
            fetchRequest.predicate = NSPredicate(format: "\(filterKey) < %@ AND isCompleted = False", argumentArray: [today])
        }
        
        
        guard let tasks = try? viewContext.fetch(fetchRequest) as? [Task], !tasks.isEmpty else { return nil }
        return tasks
    }
    
    func updateTask(with name: String) {
        
        
    }
}
