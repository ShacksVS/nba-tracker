//
//  TeamRow.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/6/24.
//

import SwiftUI

struct TeamRowView: View {
    var team: Team

    var body: some View {
        HStack(spacing: 50){
            Text(team.fullName)
                .padding()
                
            Spacer()
            
            Label("",systemImage: "arrow.right")
                .padding()
                .foregroundColor(.blue)
            
        }
    }
}

#Preview {
    TeamRowView(team: Team.mock())
}
