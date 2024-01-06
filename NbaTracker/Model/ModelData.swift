//
//  ModelData.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/5/24.
//

import Foundation

@Observable
class ModelData{
    // var teams: [String] = ["Team A", "Team B", "Team C"]
    var teams: [Team] = []
    
}

// Cant load probably because of the complexity of the dict
// that we got from endpoint (check in postman)
func getAllTeams() async throws -> [Team] {
    let endPoint = "https://www.balldontlie.io/api/v1/teams"
    
    guard let url = URL(string: endPoint) else {
        throw ApiError.invalidUrl
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw ApiError.invalidResponse
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let teamsResponse = try decoder.decode(TeamsResponse.self, from: data)
        return teamsResponse.data
    } catch {
        throw ApiError.invalidData
    }
}
