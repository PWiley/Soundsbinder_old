//
//  Endpoint.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 31.12.23.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

protocol Endpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var queryParameters: [String: Any]? { get }
}
