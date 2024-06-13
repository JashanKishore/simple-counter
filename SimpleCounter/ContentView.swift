//
//  ContentView.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 4/6/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var counterManager: CounterManager
    @Environment(\.colorScheme) var colorScheme
    @State private var showResetAlert = false
    @State private var navigateToHistory = false
    
    var body: some View {
        NavigationStack {
            ZStack{
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
                            .conditionalShadow(colorScheme: colorScheme)
                        
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
                            counterButton(label: "Increment", baseColor: .blue.opacity(0.2), animationColors: [Color.blue.opacity(1), Color.blue.opacity(0.1)], outlineColor: .blue.opacity(0.5)) {
                                counterManager.counter += counterManager.incrementValue
                            }
                            
                            counterButton(label: "Decrement", baseColor: .red.opacity(0.2), animationColors: [Color.red.opacity(1), Color.red.opacity(0.1)], outlineColor: .red.opacity(0.5)) {
                                counterManager.counter -= counterManager.incrementValue
                            }
                        }
                        
                        // Reset button with some padding and background styling
                        counterButton(label: "Reset", baseColor: .black, animationColors: [], outlineColor: colorScheme == .dark ? .white : .clear) {
                            withAnimation {
                                showResetAlert = true
                            }
                        }
                        
                        // History Log Button
                        counterButton(label: "History Log", baseColor: .gray, animationColors: []) {
                            withAnimation {
                                navigateToHistory = true
                            }
                        }
                    }
                    .padding(.bottom, 40) // Adjust padding as needed to place buttons in the bottom third
                }
                .padding()
                .background(Color("PrimaryBackground").edgesIgnoringSafeArea(.all))
                .navigationBarTitle("Simple Counter", displayMode: .inline)
                .navigationBarItems(
                    trailing: NavigationLink(destination: SettingsMenuView().environmentObject(counterManager)) {
                        // Use an SF Symbol for the settings icon
                        Image(systemName: "gearshape")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                    }
                )
                
                // Custom alert view
                if showResetAlert {
                    Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
                    CustomAlertView(
                        title: "Reset Counter",
                        message: "Are you sure you want to reset the counter?",
                        confirmAction: {
                            withAnimation {
                                print("Reset button pressed.")
                                counterManager.counter = 0
                            }
                            showResetAlert = false
                        },
                        cancelAction: {
                            showResetAlert = false
                        }
                    )
                    .transition(.scale)
                }
            }
            .animation(.easeInOut(duration: 0.2), value: showResetAlert)
            .navigationDestination(isPresented: $navigateToHistory) {
                HistoryView().environmentObject(counterManager)
            }
        }
    }
    
    // A helper function to create buttons with consistent styling
    @ViewBuilder
    private func counterButton(label: String, baseColor: Color, animationColors: [Color], outlineColor: Color = .clear, isBold: Bool = false, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            ZStack {
                AnimatedButtonBackground(baseColor: baseColor, animationColors: animationColors)
                
                // Text overlay
                Text(label)
                    .font(.title2)
                    .fontWeight(isBold ? .bold : .regular)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(outlineColor, lineWidth: 2)
            )
            .conditionalShadow(colorScheme: colorScheme)
            .frame(height: 60)
        }
    }
}

#Preview {
    ContentView().environmentObject(CounterManager())
}

