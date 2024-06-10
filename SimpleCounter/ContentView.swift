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
                    // Spacer to push content down
                    Spacer()
                    
                    // Display the current counter value with enhanced styling
                    ZStack {
                      // Background shape
                      RoundedRectangle(cornerRadius: 15)
                          .fill(LinearGradient(
                              gradient: Gradient(colors: [Color.blue, Color.purple]),
                              startPoint: .topLeading,
                              endPoint: .bottomTrailing
                          ))
                          .shadow(color: .gray, radius: 5, x: 0, y: 5)
                      
                      // Counter label
                      Text("Counter: \(counterManager.counter)")
                          .font(.largeTitle)
                          .fontWeight(.bold)
                          .foregroundColor(.white)
                          .padding()
                          .animation(.easeInOut(duration: 0.2), value: counterManager.counter) // Apply animation to counter changes
                  }
                  .frame(width: 300, height: 100) // Adjust the size as needed
                  .padding(.bottom, 40)
                    
                    // Spacer to push the counter to the middle of the screen
                    Spacer()
                    
                    // VStack for the buttons
                    VStack(spacing: 20) {
                        // HStack for Increment and Decrement buttons
                        HStack(spacing: 20) {
                            counterButton(label: "Increment", color: .blue) {
                                counterManager.counter += counterManager.incrementValue
                            }
                            
                            counterButton(label: "Decrement", color: .red) {
                                counterManager.counter -= counterManager.incrementValue
                            }
                        }
                        
                        // Reset button with some padding and background styling
                        counterButton(label: "Reset", color: .black) {
                            counterManager.counter = 0
                        }
                        
                        // Navigation link to the history view
                        NavigationLink(destination: HistoryView().environmentObject(counterManager)) {
                            Text("History Log")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        }
                    }
                    .padding(.bottom, 40) // Adjust padding as needed to place buttons in the bottom third
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
                    .font(.title2)
                    .fontWeight(isBold ? .bold : .regular)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(color)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
            }
        }
    }

#Preview {
    ContentView()
}

