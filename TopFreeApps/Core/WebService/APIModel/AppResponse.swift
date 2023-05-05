//
//  AppsResponse.swift
//  TopFreeApps
//
//  Created by Hemal Swarnasiri on 2023-01-15.
//

import Foundation

struct AppResponse: Codable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable {
    let results: [App]
}

// MARK: - Result
public struct App: Codable {
    let artistName, id, name, releaseDate: String
    let artworkUrl100: String
    let url: String
}
