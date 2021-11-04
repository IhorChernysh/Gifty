//
//  UserCD+CoreDataProperties.swift
//  Gifty
//
//  Created by Oleksii Vasyliev on 04.11.2021.
//
//

import Foundation
import CoreData


extension UserCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCD> {
        return NSFetchRequest<UserCD>(entityName: "UserCD")
    }

    @NSManaged public var age: Int16
    @NSManaged public var gender: String?
    @NSManaged public var name: String?
    @NSManaged public var preferActivity: String?

}

extension UserCD : Identifiable {

}
