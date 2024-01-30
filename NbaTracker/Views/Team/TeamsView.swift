//
//  TeamDetailView.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/5/24.
//

import SwiftUI

struct TeamsView: View {
    @Environment(ModelData.self) var modelData
    @State private var searchText: String = ""
    @FocusState private var isSearchBarFocused: Bool
    
    var filteredTeams: [Team] {
        guard !searchText.isEmpty else { return modelData.teams }
        return modelData.teams.filter { $0.fullName.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        NavigationStack {
            
            if modelData.teams.isEmpty {
                ContentUnavailableView("No Teams", systemImage: "person.2.slash",
                                       description: Text("You need to have teams here"))
            } else {
                SearchBar(searchText: $searchText, searchObject: "Teams")
                    .padding(.vertical)
                
                if filteredTeams.isEmpty {
                    ContentUnavailableView.search(text: searchText)
                } else {
                    ScrollView {
                        ForEach(filteredTeams) { team in
                            NavigationLink {
                                TeamDetailView(team: team)
                            } label: {
                                TeamRowView(team: team)
                                    .foregroundColor(Color("TextColor"))
                            }
                            Divider()
                    }                    }
                }
            }
                
        }
        .padding()
    }
}

#Preview {
    TeamsView()
        .environment(ModelData())
}
