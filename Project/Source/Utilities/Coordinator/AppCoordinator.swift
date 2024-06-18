//
//  AppCoordinator.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import UIKit
/// A coordinator responsible for managing the app's navigation flows.
final class AppCoordinator: Coordinator {

    private let window: UIWindow
    private var children: [Coordinator] = []
    var navigationController: UINavigationController

    /// Initializes an instance of `AppCoordinator`.
    ///
    /// - Parameters:
    ///   - window: The main application window.
    ///   - navigationController: The root navigation controller for the app.
    init(window: UIWindow, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.window = window
    }

    /// Starts the app coordinator by configuring dependencies and displaying the home flow.
    func start() {
        // TODO: check auth status
        displayHomeFlow()
    }
}

// MARK: Flows Helpers
private extension AppCoordinator {

    /// Displays the home flow by initializing and starting the `DefaultHomeCoordinator`.
    func displayHomeFlow() {
        var coordinator: Coordinator
        
        coordinator = HomeCoordinator(navigationController: navigationController)
        coordinator.start()
        children.append(coordinator)
        replaceRootViewController(navigationController)
    }
}

// MARK: Window Replacement
private extension AppCoordinator {

    /// Replaces the root view controller of the app's window.
    ///
    /// This method sets the specified view controller as the root view controller of the app's window,
    /// and makes the window visible.
    ///
    /// - Parameter viewController: The view controller to set as the root view controller.
    func replaceRootViewController(_ viewController: UIViewController) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
