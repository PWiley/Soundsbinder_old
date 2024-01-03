//
//  RequestCancellationToken.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 31.12.23.
//


import Foundation

final class RequestCancellationToken {

    // MARK: - Init

    init() {}

    // MARK: - Deinit

    deinit {
        willDeallocate?()
    }

    // MARK: - Properties

    var willDeallocate: (() -> Void)?
}

