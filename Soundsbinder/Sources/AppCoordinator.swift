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
    
    private unowned var presenter: AppDelegate
    private let context: Context
    private var artistCoordinator: ArtistCoordinator?

    // MARK: - Initialisers
    
    init(presenter: AppDelegate, context: Context) {
        self.presenter = presenter
        self.context = context
    }
    
    // MARK: - Coordinator
    
    func start() {
        presenter.window = UIWindow(frame: UIScreen.main.bounds)
        presenter.window?.makeKeyAndVisible()
        showArtist()
    }
    
    private func showArtist() {
        artistCoordinator = ArtistCoordinator(presenter: presenter.window!, context: context)
        artistCoordinator?.start()
    }
}
