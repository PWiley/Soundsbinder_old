//
//  ArtistSearchViewModel.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//


final class ArtistSearchViewModel {
    
    struct Artist {
            let id: Int
            let name: String
            let pictureURLString: String
    }
    
    // MARK: - Private Properties
    
    private let repository: ArtistSearchRepositoryType
    
    private var artists: [Artist] = [] {
        didSet {
            items?(artists)
        }
    }
    
    private weak var delegate: ArtistSearchScreenDelegate?

    // MARK: - Init
    
    init(artistRepository: ArtistSearchRepositoryType, delegate: ArtistSearchScreenDelegate) {
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
        delegate?.artistSearchScreenDidSelectArtist(for: artist.id)
    }
    
    // MARK: - Outputs
    
    var screenTitle: ((String) -> Void)?
    var items: (([Artist]) -> Void)?
}
extension ArtistSearchViewModel.Artist {
    init(artist: ArtistResponse.Artist) {
        self.id = artist.id
        self.name = artist.name
        self.pictureURLString = artist.pictureURLString
    }
}
