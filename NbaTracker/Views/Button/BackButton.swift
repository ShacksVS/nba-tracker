//
//  BackButton.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/30/24.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Button(action: {
                dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
                .padding()
                .foregroundColor(.blue)
            }
        }
        // After that search bar hides
        .navigationBarHidden(true)
    }
}
   
#Preview {
    BackButton()
}
