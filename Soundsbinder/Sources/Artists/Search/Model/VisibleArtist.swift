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
    let name: String
    let pictureURLString: String
    let tracklist: String
}

extension VisibleArtist {
    init(artist: ArtistSearchViewModel.Artist) {
        self.name = artist.name
        self.pictureURLString = artist.pictureURLString
        self.tracklist = artist.tracklist
    }
}

