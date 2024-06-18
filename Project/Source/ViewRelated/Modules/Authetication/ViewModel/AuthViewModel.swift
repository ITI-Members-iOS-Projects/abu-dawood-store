//
//  AuthViewModel.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/13/24.
//

import Foundation

final class AuthViewModel: BaseViewModelProtocol {
    
    var viewStatesPublisher: PassthroughSubject<ViewState, Never> = .init()
    
    var coordinator: HomeCoordinatorContact?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(coordinator: HomeCoordinatorContact? = nil) {
        self.coordinator = coordinator
    }
    
    func viewModelDidLoad() {
//        checkOngoingOrder()
        
//        UserDefaultsManager.sharedInstance.setDeviceId(deviceId: UIDevice.current.identifierForVendor!.uuidString)
//        showHome()

    }

//    private func showHome() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
//            guard let self = self else {return}
//            coordinator?.showHome()
//
//        }
//        
//    }
    
}
