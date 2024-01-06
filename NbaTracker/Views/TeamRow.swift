//
//  TeamRow.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/6/24.
//

import SwiftUI

struct TeamRow: View {
    var team: Team

    var body: some View {
        HStack(spacing: 50){
            Text(team.fullName)
                .padding([.vertical,.horizontal], 12)
                
            Spacer()
            
            Label("",systemImage: "arrow.right")
                .foregroundColor(.blue)
            
        }
    }
}

#Preview {
    TeamRow(team: Team.mock())
}
