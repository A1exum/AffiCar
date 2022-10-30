//
//  defaultSettings.swift
//  AffiCar
//
//  Created by Alex Fount on 27.08.22.
//

import Foundation
import SwiftUI

struct UserData {
    
    //system
    @AppStorage("wasStartedOnce") var wasStartedOnce: Bool?
    
    @AppStorage("folderName") var folderName: String?
    @AppStorage("defaulImageName") var defaulImageName: String?
    
    @AppStorage("folderPathURL") var folderPathURL: URL?
    @AppStorage("defaultImageURL") var defaultImageURL: URL?
    
    //user
    
    @AppStorage("userFirstName") var userFirstName: String?
    @AppStorage("userEmailuu") var userEmail: String?
    @AppStorage("phone") var phone: String?
    //car
    @AppStorage ("coverPhotoURL") var coverPhoto: URL? ///
    @AppStorage("gasPrice") var gasPrice: String?
    @AppStorage("gasPrice") var gasPriceOld: String?
    @AppStorage("odometr") var odometr: String?
    @AppStorage("odometr") var odometrOld: String?

    //addintionnaly
    @AppStorage("carYear") var carYear: String?
    @AppStorage("carBarnd") var carBarnd: String?
    @AppStorage("carModel") var carModel: String?
    @AppStorage("version") var version: String?
    @AppStorage("engineVolume") var engineVolume: String?
    @AppStorage("purchaseDate") var purchaseDate: String?
    
    @AppStorage("aboutCar") var aboutCar: String?
    
}

