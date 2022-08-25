//
//  ContentView.swift
//  AffiCar
//
//  Created by Alex Fount on 25.08.22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var notes: FetchedResults<Note>
    
    @State private var namem = ""
    var name = ""
    
    var body: some View {
        
        VStack {
            Text("hello \(namem)")
                .padding()
            Image(systemName: "hand.thumbsup")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            Button("test") {
               let note = Note(context: moc)
                    //note.id = UUID()
                var id = note.id
                note.title = "BD"
                namem = note.title ?? ""
                try? moc.save()
                print(id)
            }
        }
        

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
