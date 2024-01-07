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
    
    var body: some View {
        @Bindable var modelData = modelData
        
        NavigationSplitView {
            ScrollView {
                ForEach(modelData.teams) { team in
                    NavigationLink {
                        TeamDetailView(team: team)
                    } label: {
                        TeamRowView(team: team)
                            .foregroundColor(.black)
                    }
                    
                }
            }
        } detail: {
            Text("Team List")
        }
        .searchable(text: $searchText)
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
