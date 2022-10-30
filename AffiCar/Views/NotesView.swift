//
//  NontesView.swift
//  AffiCar
//
//  Created by Alex Fount on 29.08.22.
//

import SwiftUI

struct NotesView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date, order: .reverse)]) var notes: FetchedResults<Note>
    
    @State private var showAddScreen = false

    var body: some View {
        
        VStack {
            NavigationView {
                List{
                    ForEach(notes
                    ) { note in
                        NavigationLink {
                           // EditView(book: book)
                             //DetailedView(note: note)
                        } label: {
                            HStack {
                                
                                VStack(alignment: .leading) {
                                    Text(note.title ?? "Unknown Title")
                                    Text(note.subtitle ?? "Unknown Author" )
                                        .foregroundColor(.secondary)
                                }
                                Text(note.price ?? "")
                                    .padding(.trailing, 40)
                            }
                        }
                    }
                    .onDelete(perform: deleteNotes)
                }
                .navigationTitle("Notes")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAddScreen.toggle()
                        } label: {
                            Label("Add Note", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showAddScreen) {
                    AddNoteView()
                }
                //test

            }

        }
       
    }
    
    func deleteNotes(at offsets: IndexSet) {
        for offset in offsets {
            let note = notes[offset]
            moc.delete(note)
        }
        try?  moc.save()

    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
