//
//  HistoryView.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 9/6/2024.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var counterManager: CounterManager
    @State private var showResetAlert = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("History Log")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                // List to display the history log with the most recent entries at the top
                List(counterManager.history.reversed(), id: \.self) { entry in
                    Text(entry)
                }
                
                Button(action: {
                    withAnimation {
                        showResetAlert = true
                    }
                }) {
                    Text("Clear History")
                        .font(.title2)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationBarTitle("", displayMode: .inline) // Set title display mode to inline
            .customBackButton()
            
            // Custom alert view
            if showResetAlert {
                Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
                CustomAlertView(
                    title: "Clear History",
                    message: "Are you sure you want to clear the history?",
                    confirmAction: {
                        withAnimation {
                            counterManager.clearHistory()
                            showResetAlert = false
                        }
                    },
                    cancelAction: {
                        withAnimation {
                            showResetAlert = false
                        }
                    }
                )
                .transition(.scale)
            }
        }
        .animation(.easeInOut(duration: 0.2), value: showResetAlert)
    }
}

#Preview {
    HistoryView().environmentObject(CounterManager())
}

