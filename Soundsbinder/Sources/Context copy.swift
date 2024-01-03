//
//  Context.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 31.12.23.
//

import Foundation

class Context {
    
    // MARK: - Properties
    
    let client: HTTPClient

    // MARK: - Methods
    
    static func build() -> Context { Context() }
    
    // MARK: - Initialisers
    
    private init() {
        self.client = HTTPClient()
    }
}
