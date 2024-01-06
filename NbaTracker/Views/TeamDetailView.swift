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
        Circle()
            .foregroundColor(.secondary)
        Text("\'\(team.name)\' with ID: \(team.id)")
            .bold()
            .font(.title3)
            .padding()
        
        Text(team.abbreviation)
            .padding()
        Text(team.city)
            .padding()
        Text(team.conference)
            .padding()
        Text(team.division)
            .padding()

        Spacer()
        
    }
}

#Preview {
    return TeamDetailView(team: Team.mock())
        .environment(ModelData())
}
