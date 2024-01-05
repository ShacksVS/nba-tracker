//
//  Team.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/5/24.
//

import Foundation

struct Team: Codable, Identifiable {
    var id: Int
    var abbreviation: String
    var city: String
    var conference: String
    var division: String
    var fullName: String
    var name: String
}

struct TeamsResponse: Codable {
    let data: [Team]
}
