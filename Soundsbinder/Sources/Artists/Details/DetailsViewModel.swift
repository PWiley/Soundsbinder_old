//
//  DetailsViewModel.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import Foundation

import Foundation

final class DetailsViewModel {
    
    // MARK: - Private Properties
    
    private let repository: DetailsRepositoryType
    private var tracks: [Track]? = [] {
        didSet {
            items?(tracks!)
        }
    }

    private let trackList: String

    struct Track {
        let trackNumber: Int
        let trackTitle: String
        let trackDuration: Int
        let albumTitle: String
    }
    
    // MARK: - Init
    
    init(repository: DetailsRepositoryType, trackList: String) {
        self.repository = repository
        self.trackList = trackList
    }
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        tracks = []
        didPressAlbum(for: trackList)
    }
    
    func didPressAlbum(for trackList: String) {
        guard let url = URL(string: trackList) else { return }
        repository.searchDetails(for: url, callback: { result in
            switch result {
            case .success(let response):
                self.tracks = response.tracks.map { Track(track: $0) }
            case .failure(_):
                // Display a banner
                // ErrorParser to know which message to display in banner
                break
            }
        })
    }
    
    // MARK: - Outputs
    
    var items: InputClosure<[Track]>?
}

extension DetailsViewModel.Track {
    init(track: DetailsResponse.Track) {
        self.trackNumber = track.rank
        self.albumTitle = track.album.title
        self.trackDuration = track.duration
        self.trackTitle = track.title
    }
}
