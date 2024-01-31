//
//  ArtistEndpoint.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import Foundation

final class ArtistEndpoint: Endpoint {
    
    let method: HTTPMethod
    let path: String
    let queryParameters: [String : Any]?
    
    init(name: String) {
        self.method = .GET
        self.path = "https://api.deezer.com/search/artist"
        self.queryParameters = ["q": "\(name)"]
    }
}
