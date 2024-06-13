//
//  CustomAlertView.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 11/6/2024.
//

import SwiftUI

struct CustomAlertView: View {
    let title: String
    let message: String
    let confirmAction: () -> Void
    let cancelAction: () -> Void

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(.top)
            
            Text(message)
                .font(.body)
                .padding([.top, .horizontal])
                .multilineTextAlignment(.center)
            
            //Divider()
            .padding(.bottom)
            
            HStack {
                Button(action: cancelAction) {
                    Text("Cancel")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                }
                
                Button(action: confirmAction) {
                    Text("Confirm")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(width: 300)
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 10)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(.systemGray4), lineWidth: 1)
        )
        .padding()
    }
}

