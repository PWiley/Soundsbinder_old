//
//  ArtistEndpoint.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import Foundation

final class ArtistEndpoint: Endpoint {
    
    var method: HTTPMethod
    var path: String
    var queryParameters: [String : Any]?
    
    init(name: String) {
        self.method = .GET
        self.path = "https://api.deezer.com/search/artist"
        self.queryParameters = ["q": "\(name)"]
    }
}
