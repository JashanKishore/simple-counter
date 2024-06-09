//
//  SettingsView.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 9/6/2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var counterManager: CounterManager
    @Environment(\.presentationMode) var presentationMode
    @State private var tempIncrementValue: String = ""
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .padding()
            
            // TextField to input the increment value
            TextField("Increment Value", text: $tempIncrementValue)
                .keyboardType(.numberPad)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // Button to save the increment value
            Button(action: {
                if let newValue = Int(tempIncrementValue), newValue > 0 {
                    counterManager.incrementValue = newValue
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Save")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .onAppear {
            // Initialize the text field with the current increment value
            tempIncrementValue = "\(counterManager.incrementValue)"
        }
        .padding()
    }
}

#Preview {
    SettingsView().environmentObject(CounterManager())
}
