//
//  ArtistResponse.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import Foundation

// MARK: - ArtistResponse

struct ArtistResponse: Codable {
    let artists: [Artist]

    enum CodingKeys: String, CodingKey {
        case artists = "data"
    }
    // MARK: - Artist
    
    struct Artist: Codable {
        let name: String
        let pictureURLString: String
        let tracklist: String

        enum CodingKeys: String, CodingKey {
            case name
            case pictureURLString = "picture_medium"
            case tracklist
        }
    }
}
