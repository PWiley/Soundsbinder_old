//
//  AlbumTracksEndpoint.swift
//  Soundsbinder
//
//  Created by Marseille on 31.01.24.
//

import Foundation


struct AlbumTracksEndpoint: Endpoint {
    
    let method: HTTPMethod
    let path: String
    let queryParameters: [String:Any]?
    
    init(albumId: Int) {
        //self.path = "artist/\(artistID)/albums"
        self.path = "https://api.deezer.com/album/\(albumId)/tracks"
        self.method = .GET
        self.queryParameters = nil
    }
}




