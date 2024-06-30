//
//  HeaderView.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/24/24.
//

import UIKit

final class HeaderView: NibLoadingView {
    @IBOutlet private weak var notificationCustomView: CutsomButtonView!
    @IBOutlet private weak var searchCustomView: CutsomButtonView!
    
    var notificationButtonAction: PassthroughSubject<Void, Never> = .init()
    var searchButtonAction: PassthroughSubject<Void, Never> = .init()
    
    private var cancellables = Set<AnyCancellable>()

    func configure() {
        notificationCustomView.imageButton.publisher(forEvent: .touchUpInside)
            .subscribe(notificationButtonAction)
            .store(in: &cancellables)
        
        notificationCustomView.imageButton.publisher(forEvent: .touchUpInside)
            .subscribe(searchButtonAction)
            .store(in: &cancellables)
        
        notificationCustomView.imageButton.setImage(UIImage(named: R.image.notifications.name), for: .normal)
        
        searchCustomView.imageButton.setImage(UIImage(named: R.image.ic_search.name), for: .normal)
        
    }
    
}
