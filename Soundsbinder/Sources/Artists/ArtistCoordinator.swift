//
//  ArtistCoordinator.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 31.12.23.
//

import Foundation
import UIKit

final class ArtistCoordinator: ArtistSearchViewModelDelegate {
    func artistScreenDidSelect(tracklist: String) {
        
    }
    

    // MARK: - Properties
    
    private let presenter: UIWindow
    private let screens: Screens
    private var navigationController: UINavigationController?
    
    // MARK: - Initialisers
    
    init(presenter: UIWindow, context: Context) {
        self.presenter = presenter
        self.screens = Screens(context: context)
    }
    
    // MARK: - Coordinator
    
    func start() {
        navigationController = UINavigationController()
        presenter.rootViewController = navigationController
        showSearch()
    }
    
    private func showSearch() {
        let viewController = screens.createSearchViewController(delegate: self)
        navigationController?.pushViewController(viewController, animated: true)
        
    }

    private func showDetails() {
        let viewController = screens.createDetailsViewController(trackList: <#T##String#>)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

