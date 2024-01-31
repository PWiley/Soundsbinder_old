//
//  ArtistAlbumEndpoint.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 15.01.24.
//


import Foundation

struct ArtistAlbumEndpoint: Endpoint {
    
    let method: HTTPMethod
    let path: String
    let queryParameters: [String:Any]?
    
    init(artistID: Int) {
        //self.path = "artist/\(artistID)/albums"
        self.path = "https://api.deezer.com/artist/\(artistID)/albums"
        self.method = .GET
        self.queryParameters = nil
    }
}

