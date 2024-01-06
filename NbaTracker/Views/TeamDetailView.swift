//
//  TeamDetailView.swift
//  NbaTracker
//
//  Created by Daniil on 06.01.2024.
//

import SwiftUI

struct TeamDetailView: View {
    @Environment(ModelData.self) var modelData
    var team: Team
    
    //    var teamIndex: Int {
    //        modelData.teams.firstIndex(where: { $0.id == team.id })!
    //    }
    
    var body: some View {
//        @Bindable var modelData = modelData
        Circle()
            .foregroundColor(.secondary)
        Text(team.name)
            .bold()
            .font(.title3)
        
        //        Text(team.abbreviation)
        //                        .padding()
        //        Text(team.city)
        //                        .padding()
        //        Text(team.conference)
        //                        .padding()
        //
        Spacer()
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
    let modelData = ModelData()
    // doesnt work
    // TODO: fix the working preview
    
    return TeamDetailView(team: modelData.teams[0])
        .environment(modelData)
}
