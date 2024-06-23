//
//  PurchasesViewModel.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/23/24.
//

import Foundation

final class PurchasesViewModel: BaseViewModelProtocol {
    var coordinator: HomeCoordinatorContact?
    
    
    var viewStatesPublisher: PassthroughSubject<ViewState, Never> = .init()
    private var cancellables = Set<AnyCancellable>()
    
    init(coordinator: HomeCoordinatorContact? = nil) {
        self.coordinator = coordinator
    }
    
    func viewModelDidLoad() {
        // TODO: Refactor this function to improve performance
    }
    
}
