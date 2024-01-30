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
        NavigationStack {

            VStack {
                if modelData.players.isEmpty {
                    ContentUnavailableView("No Players", systemImage: "person.2.slash",
                                           description: Text("You need to have players here"))
                } else {
                    SearchBar(searchText: $searchText, searchObject: "Players")
                        .padding([.vertical])
                    
                    
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
                                Divider()
                            }
                        }
                    }
                }
            }
        }
    .padding()
    }
}

#Preview {
    PlayersView().environment(ModelData())
}
