//
//  OnboardingVM.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/13/24.
//

import Foundation

final class OnboardingViewModel: BaseViewModelProtocol {
    
    var coordinator: HomeCoordinatorContact?
    var viewStatesPublisher: PassthroughSubject<ViewState, Never> = .init()

    private var cancellables = Set<AnyCancellable>()
    
    private let images = [
        R.image.image.name,
        R.image.image2.name,
        R.image.maskGroup.name
    ]
    
    init(coordinator: HomeCoordinatorContact? = nil) {
        self.coordinator = coordinator
    }
    
    func viewModelDidLoad() {
        // TODO: Refactor this function to improve performance
    }
    
    func showAuth() {
        coordinator?.showAuth()
//        UserDefaultsManager.sharedInstance.sawOnboarding()
    }
    
}

extension OnboardingViewModel {
    func itemAtSectionIndex(indexPath: IndexPath) -> String {
        return images[indexPath.item]
    }
    func numberOfItems() -> Int {
        return images.count
    }
}
