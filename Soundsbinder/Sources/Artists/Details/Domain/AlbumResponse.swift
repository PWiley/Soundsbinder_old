//
//  DetailsResponse.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import Foundation

// MARK: - AlbumResponse
struct AlbumResponse: Codable {
    let albums: [Album]
    
    enum CodingKeys: String, CodingKey {
        case albums = "data"
    }
    
    // MARK: - Album
    
    struct Album: Codable {
        let id: Int
        let title: String
        let coverImageUrl: String
        
        
        enum CodingKeys: String, CodingKey {
            case id, title
            case coverImageUrl = "cover_medium"
            
        }
    }
}
