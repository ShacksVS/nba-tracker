//
//  ContentView.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/5/24.
//

import SwiftUI

struct TeamDetail: View {
    @Environment(ModelData.self) var modelData
    
    // Can't load modelData.teams probably
    var body: some View {
        ScrollView {
            ForEach(modelData.teams) { team in
                HStack(spacing: 50){
                    Text(team.fullName)
                        .padding([.vertical], 5)
                    Spacer()
                    Image(systemName: "heart.fill")
                }
            }
            Spacer()
        }
        .padding()
        .task {
            do {
                modelData.teams = try await getAllTeams()
            }
            catch BasicError.invalidUrl{
                print("Invalid URL")
            }
            catch BasicError.invalidResponse {
                print("Invalid Response")
            }
            catch BasicError.invalidData {
                print("Invalid Data")
            }
            catch {
                print("Unexpected error")
            }
        }
    }
}

#Preview {
    let modelData = ModelData()
    
    return TeamDetail()
            .environment(modelData)
}
