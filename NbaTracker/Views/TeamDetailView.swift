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
    
    var body: some View {
//        @Bindable var modelData = modelData
        
        HStack(spacing: 30) {
            Circle()
                .foregroundColor(.secondary)
                .shadow(radius: 20)
                .padding([.leading], 25)
                .frame(width:140, height: 130)
            Spacer()
            
            // ToDo align text of this VStack to the left or right
            VStack {
                Text("\'\(team.name)\' with ID: \(team.id)")
                    .bold()
                    .font(.title3)
                    .padding()
                
                Text(team.abbreviation)
                    .padding([.horizontal],15)
                
                Text(team.city)
                    .padding()
            }
        }
        Divider()
        
        HStack {
            Text(team.conference)
                .padding()
            
            Spacer()
            
            Text(team.division)
                .padding()
        }
        Divider()
        
        Text("Team members info here")

        // Spacer() // uncomment to move to the top
    }
}

#Preview {
    return TeamDetailView(team: Team.mock())
        .environment(ModelData())
}
