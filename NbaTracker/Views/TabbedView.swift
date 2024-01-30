//
//  TabbedView.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/30/24.
//

import SwiftUI

struct TabbedView: View {
    @Environment(ModelData.self) var modelData
    @State private var selection: Tab = .teams
    
    enum Tab {
        case teams
        case players
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
    
            TeamsView()
                .tabItem {
                    Label("Teams", systemImage: "person.3.fill")
                }
            
            PlayersView()
                .tabItem {
                    Label("Players", systemImage: "basketball.fill")
                }
        }
        .task {
            do {
                modelData.players = try await getAllPlayers()
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
    TabbedView().environment(ModelData())
}
