//
//  SearchBar.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/30/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    var searchObject: String
    
    var body: some View {
        TextField("Search \(searchObject)", text: $searchText)
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    if !searchText.isEmpty {
                        Button(action: {
                            searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                        }
                    }
                }.padding(.horizontal, 8)
                .foregroundColor(.gray)
            )
            .padding(.horizontal, 10)
    }
}

