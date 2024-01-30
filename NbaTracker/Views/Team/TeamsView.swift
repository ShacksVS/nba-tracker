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
            SearchBar(searchText: $searchText)

            if modelData.teams.isEmpty {
                ContentUnavailableView("No Teams", systemImage: "person.2.slash",
                                       description: Text("You need to have teams here"))
            } else {
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
                        }
                    }
                }
            }
                
        }
        .padding()
        .task {
            do {
                modelData.teams = try await getAllTeams()
            } catch let error as ApiError {
                switch(error){
                case .invalidUrl:
                    print("Invalid URL")
                    
                case .invalidResponse:
                    print("Invalid response")
                    
                case .invalidData:
                    print("Invalid data")
                }
            } catch {
                print("Unexpected error: \(error)")
            }
        }
    }
}

#Preview {
    TeamsView()
        .environment(ModelData())
}
