//
//  CategoryViewController.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/23/24.
//

import UIKit

class CategoryViewController: BaseViewController<CategoryViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: Refactor this function to improve performance
        setupBackButton()
    }
    
    private func setupBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        backButton.setTitle("back", for: .normal)
        backButton.setTitleColor(.systemBlue, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    @objc
    func backButtonTapped() {
        // Action for the custom back button
        self.navigationController?.popViewController(animated: true)
    }

}
