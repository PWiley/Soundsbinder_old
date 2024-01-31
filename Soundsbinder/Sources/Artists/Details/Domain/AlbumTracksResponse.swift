//
//  AlbumTracksResponse.swift
//  Soundsbinder
//
//  Created by Marseille on 31.01.24.
//

import Foundation

// MARK: - AlbumTracksResponse

struct AlbumTracksResponse: Codable {
    let data: [Song]
}

// MARK: - Song

struct Song: Codable {
    let title: String
    let link: String
    let duration, trackPosition, diskNumber: Int
    

    enum CodingKeys: String, CodingKey {
        case title
        case link, duration
        case trackPosition = "track_position"
        case diskNumber = "disk_number"
        
    }
}
//
//// MARK: - Artist
//struct Artist: Codable {
//    let id: Int
//    let name: Name
//    let tracklist: String
//    let type: ArtistType
//}
//
//enum Name: String, Codable {
//    case daftPunk = "Daft Punk"
//}
//
//enum ArtistType: String, Codable {
//    case artist = "artist"
//}
//
//enum Md5Image: String, Codable {
//    case the2E018122Cb56986277102D2041A592C8 = "2e018122cb56986277102d2041a592c8"
//}
//
//enum DatumType: String, Codable {
//    case track = "track"
//}

