//
//  ArtistDetailsRepository.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import Foundation

protocol ArtistDetailsRepositoryType {
    func searchAlbum(for artistId: Int,
                            callback: @escaping (Result<AlbumResponse, Error>) -> Void)
    func searchSongs(for albumId: Int,
                            callback: @escaping (Result<AlbumTracksResponse, Error>) -> Void)
}

final class ArtistDetailsRepository: ArtistDetailsRepositoryType {
    
    // MARK: - Properties
    
    private let client: HTTPClientType
    private let parser = JSONParser()
    private let token = RequestCancellationToken()
    
    init(client: HTTPClientType) {
        self.client = client
    }

    func searchSongs(for artistID: Int,
                     callback: @escaping (Result<AlbumTracksResponse, Error>) -> Void) {
        searchAlbum(for: artistID) { artistAlbum in
            let endpoint = AlbumTracksEndpoint(albumId: artistAlbum.)
            
            guard let request = RequestBuilder().build(from: endpoint) else { return }
            client.send(request: request, token: token, completionHandler: { result in
                switch result {
                case .success(let data):
                    let songs: () = self.handleSongs(data: data, callback: callback)
                    print(songs)
                case .failure(let error):
                    callback(.failure(error))
                }
            })
        }
        
        
        
    }
    
    
    
    func searchAlbum(for artistID: Int,
                     callback: @escaping (Result<AlbumResponse, Error>) -> Void) {
        let endpoint = ArtistAlbumEndpoint(artistID: artistID)
        guard let request = RequestBuilder().build(from: endpoint) else { return }
        client.send(request: request, token: token, completionHandler: { result in
            switch result {
            case .success(let data):
                var albums: () = self.handleAlbum(data: data, callback: callback)
                print(albums)
            case .failure(let error):
                callback(.failure(error))
            }
        })
    }
    
    
    private func handleAlbum(data: Data, callback: (Result<AlbumResponse, Error>) -> Void) {
        parser.processCodableResponse(data: data, callback: { (result: Result<AlbumResponse, Error>) in
            switch result {
            case .success(let response):
                callback(.success(response))
            case .failure(let error):
                callback(.failure(error))
            }
        })
    }
    private func handleSongs(data: Data, callback: (Result<AlbumTracksResponse, Error>) -> Void) {
        parser.processCodableResponse(data: data, callback: { (result: Result<AlbumTracksResponse, Error>) in
            switch result {
            case .success(let response):
                callback(.success(response))
            case .failure(let error):
                callback(.failure(error))
            }
        })
    }

    
}
