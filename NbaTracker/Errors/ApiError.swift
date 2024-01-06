//
//  ApiError.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/5/24.
//

import Foundation

enum ApiError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}
