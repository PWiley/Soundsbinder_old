//
//  VisibleArtist.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import Foundation

//// MARK: - Artist
//
//struct Artist {
//    let name: String
//    let pictureMedium: String
//    let tracklist: String
//}
// MARK: - VisibleArtist

struct VisibleArtist: Equatable {
    let id: Int
    let name: String
    let pictureURLString: String
}

extension VisibleArtist {
    init(artist: ArtistSearchViewModel.Artist) {
        self.id = artist.id
        self.name = artist.name
        self.pictureURLString = artist.pictureURLString
    }
}

