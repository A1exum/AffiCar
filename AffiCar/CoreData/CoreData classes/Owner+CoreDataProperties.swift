//
//  Owner+CoreDataProperties.swift
//  AffiCar
//
//  Created by Alex Fount on 5.10.22.
//
//

import Foundation
import CoreData


extension Owner {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Owner> {
        return NSFetchRequest<Owner>(entityName: "Owner")
    }

    @NSManaged public var ownerName: String?
    
    @NSManaged public var titleImage: Data?
    
    public var wrappedOwnerName: String {
        ownerName ?? "Unknown title"
    }
    
    public var wrappedTitleImage: Data {
        titleImage ?? Data()
    }
    
    
    
    

}

extension Owner : Identifiable {

}
