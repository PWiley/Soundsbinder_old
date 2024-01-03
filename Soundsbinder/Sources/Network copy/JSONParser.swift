//
//  JSONParser.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 31.12.23.
//

import Foundation

enum ParserError: Error {
    case badParsing(Error)
}

protocol JSONParserType {
    func processCodableResponse<T: Decodable>(data: Data, callback: (Result<T, Error>) -> Void)
}

final class JSONParser: JSONParserType {
    func processCodableResponse<T: Decodable>(data: Data, callback: (Result<T, Error>) -> Void) {
        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            callback(.success(object))
        } catch let error {
            //assertionFailure(error.localizedDescription)
            callback(.failure(ParserError.badParsing(error)))
        }
    }
}
