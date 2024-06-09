//
//  HistoryView.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 9/6/2024.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var counterManager: CounterManager
    
    var body: some View {
        VStack {
            Text("History Log")
                .font(.largeTitle)
                .padding()
            
            // List to display the history log with the most recent entries at the top
            List(counterManager.history.reversed(), id: \.self) { entry in
                Text(entry)
            }
            
            Button(action: {
                counterManager.clearHistory()
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
    }
}

#Preview {
    HistoryView().environmentObject(CounterManager())
}
