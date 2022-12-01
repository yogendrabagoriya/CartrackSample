//
//  LoginVCComposer.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation
import UIKit

struct LoginVCComposer{
    
    static func makeLoginVC() -> (UIViewController) {
        let manager = NetworkManager(session: .shared)

        let repository = CTLoginDBRepository()
        let viewModel = LoginVCViewModel(repository: repository)
        
        let loginVC = LoginViewController(viewModel: viewModel)
        
        viewModel.presenter = loginVC
        return loginVC
    }
}
