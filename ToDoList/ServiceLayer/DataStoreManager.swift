//
//  DataStoreManager.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 12.08.2022.
//

import Foundation
import CoreData

class DataStoreManager {
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
    
    func defaultValue() -> Task {
        let task = Task(context: viewContext)
        task.color = TaskColor.yellow.rawValue
        task.deadline = Date.now
        task.isCompleted = false
        task.title = "Test"
        task.type = "Basic"
        
        do {
            try viewContext.save()
        } catch let error {
            print(error)
        }
        
        return task
    }
}
