//
//  AppCoordinator.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 31.12.23.
//

import Foundation
import UIKit

final class AppCoordinator {
    
    // MARK: - Private Properties
    
    private unowned var presenter: UIWindow
    
    private let context: Context
    
    private var artistCoordinator: ArtistCoordinator?

    // MARK: - Initialisers
    
    init(presenter: UIWindow, context: Context) {
        self.presenter = presenter
        self.context = context
    }
    
    // MARK: - Coordinator
    
    func start() {
//        presenter.window = UIWindow(frame: UIScreen.main.bounds)
//        presenter.window?.makeKeyAndVisible()
        presenter.rootViewController = UIViewController()
        showSearch()
    }
    
    private func showSearch() {
        artistCoordinator = ArtistCoordinator(presenter: presenter, context: context)
        artistCoordinator?.start()
    }
}
