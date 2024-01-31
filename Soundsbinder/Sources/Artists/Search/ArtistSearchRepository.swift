//
//  ArtistSearchRepository.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import Foundation

protocol ArtistSearchRepositoryType {
    func searchArtists(for name: String,
                       callback: @escaping (Result<ArtistResponse, Error>) -> Void)
}

final class ArtistSearchRepository: ArtistSearchRepositoryType {
   
    // MARK: - Properties
    
    private let client: HTTPClientType
    private let parser = JSONParser()
    private let token = RequestCancellationToken()
    
    
    // MARK: - Initialisers
    
    init(client: HTTPClientType) {
        self.client = client
    }
    
    func searchArtists(for name: String,
                       callback: @escaping (Result<ArtistResponse,
                                                   Error>) -> Void) {
        let endpoint = ArtistEndpoint(name: name)
        guard let request = RequestBuilder().build(from: endpoint) else { return }
        client.send(request: request, token: token, completionHandler: { result in
            switch result {
            case .success(let data):
                self.handle(data: data, callback: callback)
            case .failure(let error):
                callback(.failure(error))
            }
        })
    }

    private func handle(data: Data, callback: (Result<ArtistResponse, Error>) -> Void)  {
        parser.processCodableResponse(data: data, callback: { (result: Result<ArtistResponse, Error>) in
            switch result {
            case .success(let response):
                callback(.success(response))
            case .failure(let error):
                callback(.failure(error))
            }
        })
    }
}
