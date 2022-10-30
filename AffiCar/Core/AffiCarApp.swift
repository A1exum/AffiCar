//
//  AffiCarApp.swift
//  AffiCar
//
//  Created by Alex Fount on 25.08.22.
//

import SwiftUI

@main
struct AffiCarApp: App {
    
    @StateObject private var dataController = DataContoller()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext )
            
        }
    }
}
