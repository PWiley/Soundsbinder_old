//
//  ArtistDetailsViewModel.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import Foundation


final class ArtistDetailsViewModel {
    
    struct AlbumModel: Equatable {
        let albumId: Int
        let title: String
        let coverImageUrl: String
    }
    
    struct AlbumTrackListModel: Equatable {
        let title: String
        let link: String
        let duration: Int
        let trackPosition: Int
        let diskNumber: Int
    }
    
    // MARK: - Private Properties
    
    private let artistID: Int
    
    private let repository: ArtistDetailsRepositoryType
    
    private weak var delegate: ArtistDetailsScreenDelegate?
    
    private var albumModel: [AlbumModel] = [] {
        didSet {
            items?(albumModel)
        }
    }
    
    
    // MARK: - Properties

    // MARK: - Init
    
    init(artistId: Int,
         repository: ArtistDetailsRepositoryType,
         delegate: ArtistDetailsScreenDelegate?
    ) {
        self.artistID = artistId
        self.repository = repository
        self.delegate = delegate
    }
    
    // MARK: - Inputs
    
   
    func viewWillappear() {
        didSearchArtist(for: artistID)
    }
    
    func didSearchArtist(for artistId: Int) {
        repository.searchAlbum(for: artistId) { [weak self] result in
            switch result {
            case .success(let response):
                self?.albumModel = response.albums.map { AlbumModel(albums: $0)}
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func didSearchSongs(for albumId: Int) {
        repository.searchSongs(for: albumId) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Outputs
    
    var titleText: ((String) -> Void)?
    
    var items: (([AlbumModel]) -> Void)?
}

extension ArtistDetailsViewModel.AlbumModel {
    init(albums: AlbumResponse.Album) {
        self.albumId =  albums.id
        self.title = albums.title
        self.coverImageUrl = albums.coverImageUrl
    }
}


