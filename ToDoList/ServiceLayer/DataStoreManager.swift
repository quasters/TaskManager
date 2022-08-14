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
}

extension DataStoreManager: DataProvider {
    func getTasks(currentTab: MainTab) -> [Task]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "deadline", ascending: true)]
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
    
    func saveNewTask(title: String, type: TypeTab, deadline: Date, color: TaskColor) {
        let task = Task(context: viewContext)
        
        task.title = title
        task.type = type.rawValue
        task.deadline = deadline
        task.color = color.rawValue
        
        task.isCompleted = false
        
        do {
            try viewContext.save()
        } catch let error {
            print(error)
        }
    }
    
    func updateTask(task: Task, title: String? = nil, type: TypeTab? = nil, deadline: Date? = nil, color: TaskColor? = nil, isCompleted: Bool? = nil) {
        let id = task.objectID.uriRepresentation().absoluteString
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        do {
            let results = try viewContext.fetch(fetchRequest) as? [Task]
            if let results = results, !results.isEmpty {
                for result in results {
                    if id == result.objectID.uriRepresentation().absoluteString {
                        if let title = title {
                            result.setValue(title, forKey: "title")
                        }
                        if let type = type {
                            result.setValue(type.rawValue, forKey: "type")
                        }
                        if let deadline = deadline {
                            result.setValue(deadline, forKey: "deadline")
                        }
                        if let color = color {
                            result.setValue(color.rawValue, forKey: "color")
                        }
                        if let isCompleted = isCompleted {
                            result.setValue(isCompleted, forKey: "isCompleted")
                        }
                    }
                    
                    do {
                        try viewContext.save()
                    } catch let error {
                        print(error)
                    }
                }
            }
        } catch let error {
            print(error)
        }
    }
}
