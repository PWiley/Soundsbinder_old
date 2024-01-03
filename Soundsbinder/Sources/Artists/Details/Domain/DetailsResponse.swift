//
//  DetailsResponse.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import Foundation

// MARK: - DetailsResponse

struct DetailsResponse: Decodable {
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey {
        case tracks = "data"
    }
   
    // MARK: - Track
    
    struct Track: Decodable {
        let title: String
        let duration, rank: Int
        let album: Album

    // MARK: - Album
        
        struct Album: Decodable {
            let title: String
        }
    }
}
