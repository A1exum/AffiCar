//
//  Photo+CoreDataProperties.swift
//  AffiCar
//
//  Created by Alex Fount on 5.10.22.
//
//

import Foundation
import CoreData


extension Photo {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }
    
    @NSManaged public var photoComment: String?
    @NSManaged public var photoDate: Date?
    @NSManaged public var photoImage: Data?
    @NSManaged public var photoTitle: String?
    @NSManaged public var origin: Note?
    
    public var wrappedPhotoTitle: String {
        photoTitle ?? "Unknown title"
    }
    
    public var wrappedPhotoComment: String {
        photoComment ?? "No comment"
    }
    
    public var wrappedPhotoDate: Date {
        photoDate ?? Date.now
    }
    
    public var wrappedPhotoImage: Data {
        photoImage ?? Data()
    }
    
    
    
    
    
}
