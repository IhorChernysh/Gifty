//
//  CoreDataService.swift
//  Gifty
//
//  Created by Oleksii Vasyliev on 03.11.2021.
//

import Foundation
import CoreData

final class CoreDataService {
    
    private init() {}
    
    static let shared = CoreDataService()
    private let context = CoreDataStack.shared.context
    
    func addUser(user: User) {
        guard let userEntity = NSEntityDescription.entity(forEntityName: "UserCD", in: context)
            else { return }
        
        let _ = UserCD(name: user.name ?? "",
                       age: Int16(user.age ?? 0),
                       gender: user.gender ?? "",
                       preferActivity: user.preferActivity ?? "",
                       entityDescription: userEntity,
                       context: context)
        CoreDataStack.shared.saveContext()
    }
    
    func remove(object: NSManagedObject) {
        context.delete(object)
        CoreDataStack.shared.saveContext()
    }
}
