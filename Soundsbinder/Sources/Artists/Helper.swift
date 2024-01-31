//
//  Helper.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import Foundation

//typealias VoidClosure = () -> Void

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
