//
//  Error.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/5/24.
//

import Foundation

enum BasicError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}
