//
//  UserCD+CoreDataClass.swift
//  Gifty
//
//  Created by Oleksii Vasyliev on 04.11.2021.
//
//

import Foundation
import CoreData

@objc(UserCD)
public class UserCD: NSManagedObject {

    convenience init() {
        self.init()
    }
    
    convenience init(name: String, age: Int16, gender: String, preferActivity: String, entityDescription: NSEntityDescription, context: NSManagedObjectContext) {
        self.init(entity: entityDescription, insertInto: context)
        
        self.name = name
        self.age = age
        self.gender = gender
        self.preferActivity = preferActivity
    }
}
