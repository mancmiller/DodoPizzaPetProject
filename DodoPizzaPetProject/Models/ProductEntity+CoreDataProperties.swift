//
//  ProductEntity+CoreDataProperties.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 27.06.2023.
//
//

import Foundation
import CoreData

extension ProductEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductEntity> {
        return NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
    }

    @NSManaged public var price: Int16
    @NSManaged public var name: String?
    @NSManaged public var itemDescription: String?
    @NSManaged public var image: String?
    @NSManaged public var id: Int32
    @NSManaged public var count: Int16
    @NSManaged public var category: String?

}

extension ProductEntity : Identifiable {

}
