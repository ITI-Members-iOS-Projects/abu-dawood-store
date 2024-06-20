//
//  HomeCoordinator.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import Foundation
import UIKit

protocol HomeCoordinatorContact: AnyObject {
    func showHome()
    func showAuth()
    func showOnboarding()
    func showSplashController()
    
    func navigateBack()
    func navigateToRoot()
    func dismiss(completion: (() -> Void)?)
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
        let viewModel = AuthViewModel(coordinator: self)
        let viewController = AuthViewController(viewModel: viewModel)
        let vc = LoginViewController()
        navigationController.setViewControllers([vc], animated: false)
    }
    func showOnboarding() {
        let viewModel = OnboardingViewModel(coordinator: self)
        let viewController = Onboarding(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    func showHome() {
        let viewModel = HomeViewModel(coordinator: self)
        let viewController = HomeViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
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
