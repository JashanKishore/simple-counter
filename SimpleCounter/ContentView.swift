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
            VStack {
                // Display the current counter value
                Text("Counter: \(counterManager.counter)")
                    .font(.largeTitle)
                    .padding()
                
                // Button to increment the counter
                counterButton(label: "Increment", color: .blue) {
                    counterManager.counter += 1
                }
                
                // Button to decrement the counter
                counterButton(label: "Decrement", color: .red) {
                    counterManager.counter -= 1
                }
                
                // Button to reset the counter to zero
                counterButton(label: "Reset", color: .black) {
                    counterManager.counter = 0
                }
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

