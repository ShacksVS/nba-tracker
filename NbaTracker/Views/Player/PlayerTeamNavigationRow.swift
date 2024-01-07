//
//  PlayerTeamNavigation.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/7/24.
//

import SwiftUI

struct PlayerTeamNavigationRow: View {
    var player: Player
    
    var body: some View {
        HStack(spacing: 3){
            Text("Playing in")
            NavigationLink {
                TeamDetailView(team: player.team)
            } label: {
                Text(player.team.fullName)
            }
        }
    }
}

#Preview {
    PlayerTeamNavigationRow(player: Player.mock())
}
