//
//  DetailsRepository.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import Foundation

protocol DetailsRepositoryType {
    func searchDetails(for url: URL, 
                       callback: @escaping (Result<DetailsResponse, Error>) -> Void)
}

final class DetailsRepository: DetailsRepositoryType {
    
    // MARK: - Properties
    
    private let client: HTTPClientType
    private let parser = JSONParser()
    private let token = RequestCancellationToken()
    
    init(client: HTTPClientType) {
        self.client = client
    }
    
    func searchDetails(for url: URL,
                     callback: @escaping (Result<DetailsResponse, Error>) -> Void) {
        let request = URLRequest(url: url)
        client.send(request: request, token: token) { result in
            switch result {
            case .success(let data):
                self.handle(data: data, callback: callback)
            case .failure(let error):
                callback(.failure(error))
            }
        }
    
    }
    
    private func handle(data: Data, callback: (Result<DetailsResponse, Error>) -> Void) {
        parser.processCodableResponse(data: data, callback: { (result: Result<DetailsResponse, Error>) in
            switch result {
            case .success(let response):
                callback(.success(response))
            case .failure(let error):
                callback(.failure(error))
            }
        })
    }
    
}
