//
//  PlayerRow.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/7/24.
//

import SwiftUI

struct PlayerRow: View {
    
    var player: Player
    
    var body: some View {
        HStack {
            Text("\(player.lastName) \(player.firstName)")
                .padding()
            
            Spacer()
            
            Label("", systemImage: "arrow.right")
                .padding()
        }
    }
}

#Preview {
    PlayerRow(player: Player.mock())
}
