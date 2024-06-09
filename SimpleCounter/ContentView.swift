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
            
            counterButton(label: "Increment", color: .blue) {
                counter += 1
            }
            
            counterButton(label: "Decrement", color: .red) {
                counter -= 1
            }
            
            counterButton(label: "Reset", color: .black) {
                counter = 0
            }
        }
    }
    
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
        .background(
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        if buttonWidth == nil {
                            buttonWidth = geometry.size.width
                        }
                    }
            }
        )
        .frame(width: buttonWidth)
    }
}

#Preview {
    ContentView()
}

