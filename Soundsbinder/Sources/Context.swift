//
//  Context.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 22.02.22.
//

import Foundation

class Context {
    
    // MARK: - Properties
    
    let networkClient: HTTPClient
    
    let imageProvider: ImageProvider

    
    // MARK: - Initialisers
    
    private init(networkClient: HTTPClient, imageProvider: ImageProvider) {
        self.networkClient = networkClient
        self.imageProvider = imageProvider
        
    }
}
