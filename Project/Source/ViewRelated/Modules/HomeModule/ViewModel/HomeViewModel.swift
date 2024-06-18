//
//  HomeViewModel.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import Foundation

final class HomeViewModel: BaseViewModelProtocol {
//    var coordinator: SplashCoordinatorContact?
    
    var coordinator: HomeCoordinatorContact?
    
    
    var viewStatesPublisher: PassthroughSubject<ViewState, Never> = .init()
    private var useCase: HomeUseCaseContact
    private var cancellables = Set<AnyCancellable>()
    
    init(coordinator: HomeCoordinatorContact? = nil, useCase: HomeUseCaseContact = HomeUseCase()) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func viewModelDidLoad() {
        // TODO: Refactor this function to improve performance
    }
    
}
