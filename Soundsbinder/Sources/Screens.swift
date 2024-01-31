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

protocol ArtistSearchScreenDelegate: AnyObject {
    func artistSearchScreenDidSelectArtist(for id: Int)
    // func artistScreenShouldDisplayAlert(for type: AlertType)
}

extension Screens {
    func createSearchViewController(delegate: ArtistSearchScreenDelegate) -> UIViewController {
        let viewController = artistStoryBoard.instantiateViewController(withIdentifier: "ArtistSearchViewController") as! ArtistSearchViewController
        let repository = ArtistSearchRepository(client: context.networkClient)
        let viewModel = ArtistSearchViewModel(artistRepository: repository, delegate: delegate)
        viewController.viewModel = viewModel
        viewController.imageProvider = context.imageProvider
        return viewController
    }
}

// MARK: - Details

protocol ArtistDetailsScreenDelegate: AnyObject {
    // func artistDetailScreenShouldDisplayAlert(for type: AlertType)

}

extension Screens {
    func createDetailsViewController(artistID: Int, delegate: ArtistDetailsScreenDelegate) -> UIViewController {
        let viewController = artistStoryBoard.instantiateViewController(withIdentifier: "ArtistDetailsViewController") as! ArtistDetailsViewController
        let repository = ArtistDetailsRepository(client: context.networkClient)
        let viewModel = ArtistDetailsViewModel(artistId: artistID, repository: repository, delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}
