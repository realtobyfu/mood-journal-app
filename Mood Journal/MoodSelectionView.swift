//
//  MoodSelectionView.swift
//  template
//
//  Created by Tobias Fu on 8/1/24.
//

import SwiftUI

struct MoodSelectionView: View {
    @State private var selectedMood = 0
    let moods = ["😊", "😢", "😡", "😁", "😂"]
    
    var body: some View {
        VStack {
            Text("Mood Tracker")
                .font(.largeTitle)
                .padding()
            
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
            

            
        }
    }
}

#Preview {
    MoodSelectionView()
}
