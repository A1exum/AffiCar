//
//  SetNewData.swift
//  AffiCar
//
//  Created by Alex Fount on 27.08.22.
//

import Foundation
import SwiftUI
import UIKit


class UserDataAPI {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var owners: FetchedResults<Owner>
    
    let owner = UserData()
    
    
    func setDefaultUserData() {
        owner.userFirstName = "Driver"
        owner.odometr = "0"
        owner.gasPrice = "1"
        owner.folderName = "Afiles"
        owner.defaulImageName = "defaultImg.jpg"
        
            //createdir
        createDocDir()
            //save default photo to dir
        saveImageToDocs(image: UIImage(named: "car_tmb") ?? UIImage())
            //start images
        // writeImagesToPhotoAlbum() //only for debug!!!
    }
    
    func createDocDir(){

        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        print(path)
        let docDir = path.appendingPathComponent(owner.folderName ?? "NewFolder")
        //create dir
        do {
            try FileManager.default.createDirectory(atPath: docDir.path, withIntermediateDirectories: true, attributes: nil)
            print("Catalog created in documents \(docDir)")
            try FileManager.default.createDirectory(at: docDir, withIntermediateDirectories: true, attributes: nil)
            owner.folderPathURL = docDir
        } catch {
            print("dir already exists, not created")
        }
        
    }
    
    func saveImageToDocs(image: UIImage) {
        guard let docDir = owner.folderPathURL else { return }
        
        let url = docDir.appendingPathComponent(owner.defaulImageName ?? "image")
        print(url)
        
        if let data = image.jpegData(compressionQuality: 0.8) {
            do {
                try data.write(to: url, options: .atomic)
                owner.defaultImageURL = url
                print("сохранено в галерею")
            } catch {
                print("error write to disk")
            }
        }
    }
    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func getImage(image: UIImage) {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = path.appendingPathComponent("image")
        print(url)
        guard let image = UIImage(contentsOfFile: url.path) else { return }
        //recievedImage = image
        print("олучил \(image)")
    }
    
    func writeImagesToPhotoAlbum() {
                for item in (1..<16) {
                guard  let image = UIImage(named: "car\(item)") else { return }
                    UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.saveCompleted), nil)
                    print("Seccess writing car\(item)")
            }
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishedWithError error: Error?, contextInfo: UnsafeRawPointer ) {
        print("Save finished")
    }
    

    
    
}
