//
//  HomeCoordinator.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import Foundation
import UIKit

protocol HomeCoordinatorContact: AnyObject {
    func showAuth()
    func showOnboarding()
    func showSplashController()
    
    func showTabBar()
    func showCartScreen()
    func showMoreScreen()
    
    func navigateBack()
    func navigateToRoot()
    func dismiss(completion: (() -> Void)?)
    
    var navigationController: UINavigationController { get }
}

final class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    /// starts the coordinator
    func start() {
        showSplashController()
    }
    
}
extension HomeCoordinator: HomeCoordinatorContact {
    func showSplashController() {
        let viewModel = SplashViewModel(coordinator: self)
        let viewController = Splash(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    func showAuth() {
        let viewModel = ChooseTypeViewModel(coordinator: self)
        let viewController = ChooseTypeViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    func showOnboarding() {
        let viewModel = OnboardingViewModel(coordinator: self)
        let viewController = Onboarding(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    func showTabBar() {
        let viewModel = CustomTabBarViewModel(coordinator: self)
        let viewController = CustomTabBar(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    func showCartScreen() {
        let viewModel = CartViewModel(coordinator: self)
        let viewController = CartViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    func showMoreScreen() {
        let viewModel = MoreViewModel(coordinator: self)
        let viewController = MoreViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    func dismiss(completion: (() -> Void)?) {
        
    }
    
    func navigateBack() {
        navigationController.popViewController(animated: true)
    }
    
    func navigateToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
   
    
}
