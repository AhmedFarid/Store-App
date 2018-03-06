//
//  ItemType+CoreDataProperties.swift
//  Store App
//
//  Created by FARIDO on 3/6/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
