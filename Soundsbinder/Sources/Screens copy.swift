//
//  Screens.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 31.12.23.
//

import UIKit

final class Screens {
    
    // MARK: - Properties
    
    private let artistStoryBoard = UIStoryboard(name: "Artist", bundle: Bundle(for: Screens.self))
    
    private let context: Context
    
    // MARK: - Initialisers
    
    init(context: Context) {
        self.context = context
    }

}

// MARK: - Search

extension Screens {
    func createSearchViewController() -> UIViewController {
        let viewController = artistStoryBoard.instantiateViewController(withIdentifier: "ArtistSearchViewController") as! ArtistSearchViewController
        return viewController
    }
}

// MARK: - Details

extension Screens {
    func createDetailsViewController() -> UIViewController {
        let viewController = UIViewController()
        return viewController
    }
}
