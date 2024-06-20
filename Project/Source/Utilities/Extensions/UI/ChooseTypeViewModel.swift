//
//  ChooseTypeViewModel.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/20/24.
//

import Foundation

final class ChooseTypeViewModel: BaseViewModelProtocol {
    
    var viewStatesPublisher: PassthroughSubject<ViewState, Never> = .init()
    
    var coordinator: HomeCoordinatorContact?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(coordinator: HomeCoordinatorContact? = nil) {
        self.coordinator = coordinator
    }
    
    func viewModelDidLoad() {
        // TODO: Refactor this function to improve performance
    }
    
    func showLoginController() {
        let viewController = LoginViewController()
        coordinator?.navigationController.pushViewController(viewController, animated: true)
    }
    
}
