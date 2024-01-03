//
//  ArtistCoordinator.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 31.12.23.
//

import Foundation
import UIKit

final class ArtistCoordinator {
    
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
       showSearch()
    }
    
    private func showSearch() {
        let viewController = screens.createSearchViewController()
        navigationController = UINavigationController(rootViewController: viewController)
        guard let navigationController = navigationController else {
            return
        }
        presenter.rootViewController = navigationController
    }

    private func showDetails() {
        let viewController = screens.createDetailsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

