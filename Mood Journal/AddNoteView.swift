//
//  AddNoteView.swift
//  template
//
//  Created by Tobias Fu on 8/1/24.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedMood = 0
    @State private var noteText = ""
    let moods = ["😊", "😢", "😡", "😁", "😂"]
    
    var onSave: (Note) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Select Your Mood")
                    .font(.headline)
                
                Text(moods[selectedMood])
                    .font(.system(size: 100))
                    .padding()

                
                Picker("Select your mood", selection: $selectedMood) {
                    Text("Happy").tag(0)
                    Text("Sad").tag(1)
                    Text("Angry").tag(2)
                    Text("Smart").tag(3)
                    Text("LOL").tag(4)
                }

                .pickerStyle(SegmentedPickerStyle())
                .padding()

                TextField("Write your note here...", text: $noteText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                Button(action: saveNote) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("New Note")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                    }
                }
            }
        }
    }
    
    private func saveNote() {
        let newNote = Note(emoji: moods[selectedMood], text: noteText)
        onSave(newNote)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView { _ in }
    }
}
