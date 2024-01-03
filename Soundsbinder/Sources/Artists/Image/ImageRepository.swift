//
//  ImageRepository.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 31.12.23.
//

import Foundation


protocol ImageRepositoryType {
    func downloadImage(for url: URL, cancelledBy cancellationToken: RequestCancellationToken, callback: @escaping (Data?) -> Void)
}

final class ImageRepository: ImageRepositoryType {
    
    // MARK: - Properties
    
    private let networkClient: HTTPClient
    
    init(networkClient: HTTPClient) {
        self.networkClient = networkClient
    }
    
    // MARK: - ImageRepositoryType
    
    func downloadImage(for url: URL,
                       cancelledBy cancellationToken: RequestCancellationToken,
                       callback: @escaping (Data?) -> Void) {
        let request = URLRequest(url: url)
        networkClient.send(request: request, token: cancellationToken) { response in
            switch response {
            case .success(let data):
                callback(data)
            case .failure:
                callback(nil)
            }
        }
    }
}

