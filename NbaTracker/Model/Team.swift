//
//  Team.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/5/24.
//

import Foundation

struct Team: Codable, Identifiable {
    let id: Int
    let abbreviation: String
    let name: String
    let fullName: String
    let city: String
    let conference: String
    let division: String
}

struct TeamsResponse: Codable {
    let data: [Team]
}
