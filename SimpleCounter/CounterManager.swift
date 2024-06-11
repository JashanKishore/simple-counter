//
//  CounterManager.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 9/6/2024.

import Foundation

// This class manages the counter value and the increment value, handling data persistence using UserDefaults
class CounterManager: ObservableObject {
    // The @Published property wrapper automatically notifies any views that are observing this class
    @Published var counter: Int {
        didSet {
            // Save the updated counter value to UserDefaults whenever it changes
            UserDefaults.standard.set(counter, forKey: "counter")
            //UserDefaults.standard.synchronize() // Force synchronization
            // Add a new entry to the history log whenever the counter changes
            addHistoryEntry(change: counter - oldValue)
        }
    }
    
    @Published var incrementValue: Int {
        didSet {
            // Save the updated increment value to UserDefaults whenever it changes
            UserDefaults.standard.set(incrementValue, forKey: "incrementValue")
            //UserDefaults.standard.synchronize() // Force synchronization
        }
    }
    
    @Published var history: [String] {
           didSet {
               // Save the updated history log to UserDefaults
               UserDefaults.standard.set(history, forKey: "history")
               //UserDefaults.standard.synchronize() // Force synchronization
           }
       }
    
    // Initialize the counter and increment values from UserDefaults
    init() {
        self.counter = UserDefaults.standard.integer(forKey: "counter")
        self.incrementValue = UserDefaults.standard.integer(forKey: "incrementValue")
        self.history = UserDefaults.standard.stringArray(forKey: "history") ?? []
        // Set a default increment value if none is found in UserDefaults
        if incrementValue == 0 {
            incrementValue = 1
        }
    }
    
    // Function to add a new entry to the history log
        private func addHistoryEntry(change: Int) {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .medium
            let date = formatter.string(from: Date())
            
            let entry: String
            if change > 0 {
                entry = "Incremented by \(change) to \(counter) on \(date)"
            } else if change < 0 {
                entry = "Decremented by \(-change) to \(counter) on \(date)"
            } else {
                entry = "Reset to \(counter) on \(date)"
            }
            
            history.append(entry)
        }
        
        // Function to clear the history log
        func clearHistory() {
            history.removeAll()
        }
}

