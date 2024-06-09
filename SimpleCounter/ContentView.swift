//
//  ContentView.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 4/6/2024.
//

import SwiftUI

struct ContentView: View {
    // @StateObject creates an observable instance of CounterManager that will be retained by this view
    @StateObject private var counterManager = CounterManager()
    
    var body: some View {
        NavigationView {
            VStack {
            
                Spacer()
                
                // Display the current counter value with some padding and background styling
                Text("Counter: \(counterManager.counter)")
                    .font(.largeTitle)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                Spacer()
                
                //Vstack for buttons
                VStack(spacing: 20) {
                    // Button to increment the counter
                    HStack (spacing: 20){
                        counterButton(label: "Increment", color: .blue) {
                            counterManager.counter += counterManager.incrementValue
                        }
                        
                        // Button to decrement the counter
                        counterButton(label: "Decrement", color: .red) {
                            counterManager.counter -= counterManager.incrementValue
                        }
                    }
                    
                    // Button to reset the counter to zero with padding and background styling
                    counterButton(label: "Reset", color: .black) {
                        counterManager.counter = 0
                    }
                    
                    
                    // Navigation link to the history view
                    NavigationLink(destination: HistoryView().environmentObject(counterManager)) {
                        Text("History Log")
                            .font(.title2)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom, 10)
            }
            .padding()
            .navigationBarTitle("Simple Counter", displayMode: .inline)
            .navigationBarItems(
                trailing: NavigationLink(destination: SettingsMenuView().environmentObject(counterManager)) {
                    // Use an SF Symbol for the settings icon
                    Image(systemName: "gearshape")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                }
            )
        }
    }
    
    // A helper function to create buttons with consistent styling
        @ViewBuilder
        private func counterButton(label: String, color: Color, isBold: Bool = false, action: @escaping () -> Void) -> some View {
            Button(action: action) {
                Text(label)
                    .font(.title)
                    .fontWeight(isBold ? .bold : .regular)
                    .padding()
                    .background(color)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .fixedSize(horizontal: true, vertical: false)
            }
        }
    }

#Preview {
    ContentView()
}

