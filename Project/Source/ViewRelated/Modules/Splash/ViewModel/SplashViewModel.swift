//
//  SplashViewModel.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/13/24.
//

import Foundation

final class SplashViewModel: BaseViewModelProtocol {
    
    var viewStatesPublisher: PassthroughSubject<ViewState, Never> = .init()
    
    var coordinator: HomeCoordinatorContact?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(coordinator: HomeCoordinatorContact? = nil) {
        self.coordinator = coordinator
    }
    
    func viewModelDidLoad() {
        showHome()
    }

    private func showHome() {
        viewStatesPublisher.send(.splash)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { [weak self] in
            guard let self = self else {return}
            let isThatSecondTime = UserDefaultsManager.sharedInstance.checkingShowingOnboarding()
            let isLoggedIn = UserDefaultsManager.sharedInstance.isLoggedIn()
            if isThatSecondTime {
                if isLoggedIn {
                    coordinator?.showHome()
                } else {
                    coordinator?.showAuth()
                }
            } else {
                coordinator?.showOnboarding()
            }
            
        }
    }
    
}
