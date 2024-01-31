//
//  VisibleTrack.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import Foundation

// MARK: - VisibleTrack

struct VisibleTrack: Equatable {
    let trackNumber: Int
    let trackTitle: String
    let trackDuration: String
    let albumTitle: String
}

//extension VisibleTrack {
//    init(track: ArtistDetailsViewModel.Track) {
//        self.trackNumber = "\(track.trackNumber)"
//        self.trackTitle = track.trackTitle
//        self.trackDuration = "\(track.trackDuration)"
//        self.albumTitle = track.albumTitle
//    }
//}
