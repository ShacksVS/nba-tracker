//
//  TeamDetailView.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/5/24.
//

import SwiftUI

struct TeamsView: View {
    @Environment(ModelData.self) var modelData
    @State private var isTeamDetailViewPresented = false

    var body: some View {
        //        @Bindable var modelData = modelData

        ScrollView {
            ForEach(modelData.teams) { team in
                HStack(spacing: 50){
                    Text(team.fullName)
                        .padding([.vertical], 12)
                    
                    
                    // Fix navigation
                    NavigationStack{
                        NavigationLink {
                            TeamDetailView(team: team)
                        } label: {
                            Spacer()
                            Label("",systemImage: "arrow.right")
                                .onTapGesture {
                                    isTeamDetailViewPresented.toggle()
                                }
                        }.sheet(isPresented: $isTeamDetailViewPresented) {
                            TeamDetailView(team: team)
                        }
                    }
                }
            }
            Spacer()
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
