//
//  document> ChooseTypeViewController.swift
//  Abu Dawood
//
//  Created by Abdallah ismail on 19/06/2024.
//

import UIKit

final class ChooseTypeViewController: BaseViewController<ChooseTypeViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: Refactor this function to improve performance
    }

    @IBAction private func loginButtonOnPressed(_ sender: YellowCustomButton) {
        viewModel.showLoginController()
    }
    

}
