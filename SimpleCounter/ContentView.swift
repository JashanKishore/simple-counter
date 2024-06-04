//
//  ContentView.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 4/6/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    @State private var buttonWidth: CGFloat?  // stores width of original button for dynamic sizing of other buttons
    
    var body: some View {
        VStack {
            Text("Counter: \(counter)")
                .font(.largeTitle)
                .padding()
            
            
            Button(action: {
                counter += 1
            }) {
                Text("Increment")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .fixedSize(horizontal: true, vertical: false) // Used on text fields to prevent wrapping.
            }
            .background(
                GeometryReader { geometry in  // Measures the size of button and updates buttonWidth variable
                    Color.clear
                        .onAppear {
                            self.buttonWidth = geometry.size.width
                        }
                }
            )
            
            
            Button(action: {
                counter -= 1
            }) {
                Text("Decrement")
                    .font(.title)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .fixedSize(horizontal: true, vertical: false)
            }
            .frame(width: buttonWidth) // Width is set to match width of first button
            
            
        }
    }
}

#Preview {
    ContentView()
}
