//
//  AddNoteView.swift
//  AffiCar
//
//  Created by Alex Fount on 29.08.22.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var subtitle = ""
    @State private var comment = ""

    @State private var noteCategory = ""
    @State private var date = Date()
    @State private var cost = 3
    @State private var price = ""
    @State private var odometr = ""
    
     @State private var id = UUID()
    let categories = ["Simple note", "Auro", "Service", "Wheels"]

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Subtitle", text: $subtitle)
                    TextField("Price", text: $price)
                        .keyboardType(.decimalPad)

                    Picker("Category", selection: $noteCategory) {
                        ForEach(categories, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    TextEditor(text: $comment).frame(minHeight: 100)

                } header: {
                    Text("Your comment")
                }
                
                NoteImagesView()
                
                Section {
                    HStack {
                        Button("Cancel") {
                            print("canceleeee")
                            dismiss()
                        }.frame(width: 100)
                        Spacer()
                        Button("Save") {
                            print("ssssssaaa")
                            saveNewNoteToDB()
                            dismiss()
                        }
                    }

                }
            }
            .navigationTitle("New note")
        }
    }
    func saveNewNoteToDB(){
        let newNote = Note(context: moc)
        newNote.id = id
        newNote.title = title
        newNote.subtitle = subtitle
        newNote.price = price
        newNote.date = date
        try?  moc.save()
    }
    
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
