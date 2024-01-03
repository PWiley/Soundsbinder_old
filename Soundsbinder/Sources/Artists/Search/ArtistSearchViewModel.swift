//
//  ArtistSearchViewModel.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import Foundation

protocol ArtistSearchViewModelDelegate: AnyObject {
    func artistScreenDidSelect(tracklist: String)
}

final class ArtistSearchViewModel {
    
    // MARK: - Private Properties
    
    private let repository: ArtistSearchRepositoryType
    
    private var artists: [Artist] = [] {
        didSet {
            items?(artists)
        }
    }
    
    struct Artist {
            let name: String
            let pictureURLString: String
        let tracklist: String
    }

    private weak var delegate: ArtistSearchViewModelDelegate?

    // MARK: - Init
    
    init(artistRepository: ArtistSearchRepositoryType, delegate: ArtistSearchViewModelDelegate) {
        self.repository = artistRepository
        self.delegate = delegate
    }
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        screenTitle?("Search an artist name 🤘")
        artists = []
        
    }
    
    func didPressSearch(for name: String) {
        repository.searchArtists(for: name) { [weak self] result in
            switch result {
            case .success(let response):
                self?.artists = response.artists.map { Artist(artist: $0)}
            case .failure(let error):
                assertionFailure(error.localizedDescription)
            }
        }
    }
    
    func didSelectItem(index: Int) {
        guard artists.indices.contains(index) else {
            print("FatalError")
            return
        }
        let artist = artists[index]
        delegate?.artistScreenDidSelect(tracklist: artist.tracklist)
    }
    
    // MARK: - Outputs
    
    var screenTitle: InputClosure<String>?
    var items: InputClosure<[Artist]>?
}
extension ArtistSearchViewModel.Artist {
    init(artist: ArtistResponse.Artist) {
        self.name = artist.name
        self.pictureURLString = artist.pictureURLString
        self.tracklist = artist.tracklist
    }
}
