//
//  SettingsView.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 9/6/2024.
//

import SwiftUI

struct CustomiseIncrementView: View {
    @EnvironmentObject var counterManager: CounterManager
    @Environment(\.presentationMode) var presentationMode
    @State private var tempIncrementValue: String = ""
    
    var body: some View {
            VStack {
                // Title
                Text("Change increment value")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                Spacer()
                
                // Label and TextField for increment value
                VStack(alignment: .leading, spacing: 10) {
                    Text("Increment Value")
                        .font(.headline)
                    
                    TextField("Enter increment value", text: $tempIncrementValue)
                        .keyboardType(.numberPad)  // Ensures only numbers can be input
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Save Button
                Button(action: {
                    if let newValue = Int(tempIncrementValue), newValue > 0 {
                        counterManager.incrementValue = newValue
                        presentationMode.wrappedValue.dismiss()  // Close the customize increment view
                    }
                }) {
                    Text("Save")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                
                Spacer()
            }
            .onAppear {
                // Initialize the text field with the current increment value
                tempIncrementValue = "\(counterManager.incrementValue)"
            }
        }
    }

#Preview {
    CustomiseIncrementView().environmentObject(CounterManager())
}
