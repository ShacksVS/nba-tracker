//
//  Player.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/7/24.
//

import Foundation

struct Player: Codable, Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    var position: String
    var team: Team
    
    static func mock(id:Int = 1, firstName: String = "Viktor", lastName: String = "Sovyak", position: String = "G", team: Team = Team.mock()) -> Player {
        return Player(id: id, firstName: firstName, lastName: lastName, position: position, team: team)
    }
}

struct PlayerResponse: Codable {
    let data: [Player]
}
