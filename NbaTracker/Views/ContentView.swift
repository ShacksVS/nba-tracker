//
//  ContentView.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/5/24.
//

import SwiftUI

struct ContentView: View {
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
        }
}

#Preview {
    ContentView().environment(ModelData())
}
