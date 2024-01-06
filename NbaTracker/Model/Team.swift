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
    
    static func mock(id: Int = 1, abbreviation: String = "Abbreviation", name: String = "Name", fullName: String = "Full Name", city: String = "City", conference: String = "Conference", division: String = "Division") -> Team {
        return Team(id: id, abbreviation: abbreviation, name: name, fullName: fullName, city: city, conference: conference, division: division)
    }
}

struct TeamsResponse: Codable {
    let data: [Team]
}
