//
//  ContentView.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationStack{
            NavigationLink{
                TabbedView()
            } label: {
                Text("Enter")
            }
            .navigationBarHidden(true)
        }.task {
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
    ContentView().environment(ModelData())
}
