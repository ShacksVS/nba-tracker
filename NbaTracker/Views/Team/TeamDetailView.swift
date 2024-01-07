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
            
            VStack(alignment: .leading){
                Text(team.fullName)
                    .bold()
                    .padding()
                
                Text("\(team.name), \(team.abbreviation)")
                    .padding([.horizontal],15)
                
                Text("From \(team.city)")
                    .padding()
            }
        }
        Divider()
        
        HStack {
            Text("Conference: \(team.conference)")
                .padding()
            
            Spacer()
            
            Text("Division: \(team.division)")
                .padding()
        }
        Divider()
        
        Text("Team members info here")

        Spacer()
    }
}

#Preview {
    TeamDetailView(team: Team.mock())
        .environment(ModelData())
}
