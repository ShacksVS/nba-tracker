//
//  PlayersView.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/7/24.
//

import SwiftUI

struct PlayersView: View {
    @Environment(ModelData.self) var modelData
    @State private var searchText: String = ""
    
    var filteredPlayers: [Player] {
        guard !searchText.isEmpty else { return modelData.players }
        return modelData.players.filter { $0.firstName.lowercased().contains(searchText.lowercased()) || $0.lastName.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        NavigationSplitView {
            if modelData.players.isEmpty {
                ContentUnavailableView("No Players", systemImage: "person.2.slash",
                                       description: Text("You need to have players here"))
            } else {
                if filteredPlayers.isEmpty {
                    ContentUnavailableView.search(text: searchText)
                } else {
                    ScrollView {
                        ForEach(filteredPlayers) { player in
                            NavigationLink {
                                PlayerDetailView(player: player)
                            } label: {
                                PlayerRow(player: player)
                                    .foregroundColor(Color("TextColor"))
                            }
                        }
                    }
                }
            }
        }
    detail: {
        Text("Players List")
    }
    .searchable(text: $searchText, prompt: "Search players")
    .padding()
    .task {
        do {
            modelData.players = try await getAllPlayers()
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
    PlayersView().environment(ModelData())
}
