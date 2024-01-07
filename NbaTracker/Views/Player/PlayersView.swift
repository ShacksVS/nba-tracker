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
    
    var body: some View {
        NavigationSplitView {
            ScrollView {
                ForEach(modelData.players) { player in
                    NavigationLink {
                        PlayerDetailView(player: player)
                    } label: {
                        PlayerRow(player: player)
                            .foregroundColor(.black)
                    }
                    
                }
            }
        } detail: {
            Text("Players List")
        }
        .searchable(text: $searchText)
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
