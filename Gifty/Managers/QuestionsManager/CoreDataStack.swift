//
//  CoreDataStack.swift
//  Gifty
//
//  Created by Oleksii Vasyliev on 03.11.2021.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    static let shared = CoreDataStack()
    private let containerName = "Gifty"
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentCloudKitContainer(name: containerName)
        container.loadPersistentStores(completionHandler: { (_, error) in
            guard let error = error as NSError? else { return }
            fatalError("###\(#function): Failed to load persistent stores:\(error)")
        })
        
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.automaticallyMergesChangesFromParent = true
  
        return container
    }()
    
    var context: NSManagedObjectContext { persistentContainer.viewContext }
    var container: NSPersistentContainer { persistentContainer }
    
    // MARK: - Methods
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                // isolate working from different place (server - user interaction and so on)
                try context.setQueryGenerationFrom(.current)
                try context.save()
            } catch {
                context.rollback()
                let nserror = error as NSError
                print(nserror)
            }
        }
    }
    
    func performBackgroundTask(completion: @escaping ((NSManagedObjectContext) -> Void)) {
        persistentContainer.performBackgroundTask { context in
            context.perform {
                completion(context)
            }
        }
    }
    
    func performSyncBackgroundTask(completion: @escaping ((NSManagedObjectContext) -> Void)) {
        persistentContainer.performBackgroundTask { context in
            context.performAndWait {
                completion(context)
            }
        }
    }
}
