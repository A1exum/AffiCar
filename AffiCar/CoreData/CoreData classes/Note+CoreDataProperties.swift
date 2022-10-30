//
//  Note+CoreDataProperties.swift
//  AffiCar
//
//  Created by Alex Fount on 5.10.22.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var comment: String?
    @NSManaged public var cost: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var noteCategory: String?
    @NSManaged public var odometr: String?
    @NSManaged public var notePhoto: Data?
    @NSManaged public var photosID: UUID?
    @NSManaged public var price: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?
    @NSManaged public var photo: NSSet?
    
    public var wrappedTitle: String {
        title ?? "Unknown title"
    }
    
    public var wrappedComment: String {
        comment ?? "No comment"
    }
    
    public var wrappedSubtitle: String {
        subtitle ?? "No subtitle"
    }
    
    public var wrappedPrice: String {
       price ?? "no price"
    }
    
    public var wrappedCost: String {
       cost ?? "no cost"
    }
    
    public var wrappedOdometr: String {
       odometr ?? "Unknown odometr"
    }
    
    public var wrappedCategory: String {
        noteCategory ?? "Unknown category"
    }
    
    public var wrappedDate: Date {
        date ?? Date.now
    }
    

    
    public var wrappedID: UUID {
        id ?? UUID()
    }
    
    
    
    
    
    
    public var photoArray: [Photo] {
        let set = photo as? Set<Photo> ?? []
        return set.sorted {
            $0.wrappedPhotoTitle < $1.wrappedPhotoTitle
        }
        
    }
    
//    public var wrapped: String {
//         ?? "Unknown "
//    }
    

}

// MARK: Generated accessors for photo
extension Note {

    @objc(addPhotoObject:)
    @NSManaged public func addToPhoto(_ value: Photo)

    @objc(removePhotoObject:)
    @NSManaged public func removeFromPhoto(_ value: Photo)

    @objc(addPhoto:)
    @NSManaged public func addToPhoto(_ values: NSSet)

    @objc(removePhoto:)
    @NSManaged public func removeFromPhoto(_ values: NSSet)

}

extension Note : Identifiable {

}
