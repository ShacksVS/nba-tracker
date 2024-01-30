//
//  PlayerDetailView.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/7/24.
//

import SwiftUI

struct PlayerDetailView: View {
    
    var player: Player
    
    var body: some View {
        NavigationStack {
            HStack {
                BackButton()
                Spacer()
            }

            VStack(alignment: .leading) {
                Spacer()
                Text("\(player.lastName) \(player.firstName)")
                
                PlayerTeamNavigationRow(player: player)
                
                Text("Position: \(player.position)")
            
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    PlayerDetailView(player: Player.mock())
        .environment(ModelData())
}
