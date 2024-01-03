//
//  AppDelegate.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 31.12.23.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var context: Context!
    
    // MARK: - Private Properties
    
    private var coordinator: AppCoordinator!
    private var imageCache: NSCache<NSString, NSData>!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.makeKeyAndVisible()
        
        imageCache = NSCache<NSString, NSData>()

        context = Context!
        coordinator = AppCoordinator(presenter: window!, context: context)
        coordinator.start()
        return true
    }
    
}
