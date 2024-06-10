//
//  SettingsMenuView.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 9/6/2024.
//

import SwiftUI

struct SettingsMenuView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        List {
            Section(header: Text("Counter Settings")) {
                NavigationLink(destination: CustomiseIncrementView().environmentObject(CounterManager())) {
                    Text("Change increment value")
                }
            }
            
            // Additional sections and settings can be added here
            
        }
        .listStyle(GroupedListStyle()) // Use a grouped style for the list
        .navigationBarTitle("Settings", displayMode: .inline) // Inline title for a traditional settings look
        .customBackButton()
    }
}

#Preview {
    SettingsMenuView()
}
