//
//  SettingsMenuView.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 9/6/2024.
//

import SwiftUI

struct SettingsMenuView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .padding()
            
            // Navigation link to customise increment value
            NavigationLink(destination: CustomiseIncrementView().environmentObject(CounterManager())) {
                Text("Customize Increment Value")
                    .font(.title2)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            // Add more settings options here as needed
        }
    }
}

#Preview {
    SettingsMenuView()
}
