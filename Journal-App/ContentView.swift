//
//  ContentView.swift
//  template
//
//  Created by Tobias Fu on 7/31/24.
//

import SwiftUI

struct Note: Identifiable {
    var id = UUID()
    var emoji: String
    var text: String
}


struct ContentView: View {
    @State private var notes: [Note] = []
    @State private var showingAddNoteView = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(notes) { note in
                        HStack {
                            Text(note.emoji)
                                .font(.largeTitle)
                            Text(note.text)
                                .onTapGesture {
                                    // Handle note selection if needed
                                }
                            Spacer()
                        }
                    }
                    .onDelete(perform: deleteNote)
                }
                .navigationTitle("Journal")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingAddNoteView = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddNoteView) {
            AddNoteView { newNote in
                notes.append(newNote)
                showingAddNoteView = false
            }
        }
    }
    
    private func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
