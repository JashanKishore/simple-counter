//
//  SettingsMenuView.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 9/6/2024.
//

import SwiftUI

struct SettingsMenuView: View {
    @EnvironmentObject var counterManager: CounterManager
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some View {
        List {
            Section(header: Text("Counter Settings")) {
                NavigationLink(destination: CustomiseIncrementView().environmentObject(counterManager)) { // Use the environment object
                    Text("Change increment value")
                }
            }
            Section(header: Text("Appearance")) { // New section for appearance settings
                            Toggle(isOn: $isDarkMode) {
                                Text("Dark Mode")
                            }
                        }
            
        }
        .listStyle(GroupedListStyle()) // Use a grouped style for the list
        .navigationBarTitle("Settings", displayMode: .inline) // Inline title for a traditional settings look
        .customBackButton()
    }
}

#Preview {
    SettingsMenuView().environmentObject(CounterManager())
}
