//
//  CustomTabBar.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/23/24.
//

import UIKit

final class CustomTabBar: BaseViewController<CustomTabBarViewModel> {

    @IBOutlet private weak var customTabBar: CustomizedTabBar!
    @IBOutlet private weak var dummyView: UIView!
    
    lazy var middleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: R.image.cart.name), for: .normal)
        button.backgroundColor = .clear
        button.circular = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Refactor this function to improve performance
        setupUI()
    }
    
    private func setupUI() {
        customTabBar.configure()
        createMiddleButton()
        buttonsObserver()
        showHomeScreen()
    }
    
}

// MARK: - Observer
extension CustomTabBar {
    private func buttonsObserver() {
        customTabBar.homeButtonAction.sink { [weak self] _ in
            guard let self = self else { return }
            print("Home screen")
            customTabBar.changeSelectedIndex(selectedIndex: .home)
            showHomeScreen()
        }.store(in: &cancellables)
        
        customTabBar.categoryButtonAction.sink { [weak self] _ in
            guard let self = self else { return }
            print("Category screen")
            customTabBar.changeSelectedIndex(selectedIndex: .category)
            showCategoryScreen()
        }.store(in: &cancellables)
        
        customTabBar.purchasesButtonAction.sink { [weak self] _ in
            guard let self = self else { return }
            print("Purchases screen")
            customTabBar.changeSelectedIndex(selectedIndex: .purchases)
            showPurchasesScreen()
        }.store(in: &cancellables)
        
        customTabBar.moreButtonAction.sink { [weak self] _ in
            guard let self = self else { return }
            print("More screen")
            viewModel.showMoreScreen()
        }.store(in: &cancellables)
    }
    
    private func createMiddleButton() {
        view.addSubview(middleButton)
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            middleButton.widthAnchor.constraint(equalToConstant: 60),
            middleButton.heightAnchor.constraint(equalToConstant: 60),
            middleButton.topAnchor.constraint(equalTo: customTabBar.topAnchor, constant: -20)
        ])
        
        middleButton.addTarget(self, action: #selector(didSelectMiddleButton), for: .touchUpInside)
        customTabBar.addSubview(middleButton)
    }
    
    @objc
    private func didSelectMiddleButton() {
        print("pressed middle button")
        viewModel.showCartScreen()
    }
    
}

// MARK: - Tab bar screens
extension CustomTabBar {
    private func showHomeScreen() {
        let viewModel = HomeViewModel(coordinator: viewModel.coordinator)
        let homeViewController = HomeViewController(viewModel: viewModel)
        addContentViewController(homeViewController)
    }
    
    private func showCategoryScreen() {
        let viewModel = CategoryViewModel(coordinator: viewModel.coordinator)
        let categoryViewController = CategoryViewController(viewModel: viewModel)
        addContentViewController(categoryViewController)
    }
    
    private func showPurchasesScreen() {
        let viewModel = PurchasesViewModel(coordinator: viewModel.coordinator)
        let purchasesViewController = PurchasesViewController(viewModel: viewModel)
        addContentViewController(purchasesViewController)
    }
    
    private func addContentViewController(_ viewController: UIViewController) {
        // Remove any existing child view controllers
        for child in children {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }

        // Add the new view controller
        addChild(viewController)
        dummyView.addSubview(viewController.view)
        viewController.view.frame = dummyView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
}
