//
//  LoginViewController.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation
import UIKit

protocol LoginVCViewModelProtocol{
    func verifyCredentials(credentials: Dictionary<String, String>)
}

class LoginViewController: NibViewController{
    
    private var viewModel: LoginVCViewModelProtocol?
    
    //MARK: - Life cycle methods
    init(viewModel: LoginVCViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.verifyCredentials(credentials: [:])
    }
}


extension LoginViewController: LoginVCPresenter{
    func validCredential() {
        let vc = HomeVCComposer.makeHomeVC()
        let homeNavigation = UINavigationController(rootViewController: vc)
        self.present(homeNavigation, animated: true)
    }
    
    func inValidCredentials(info: AlertInfo) {
        
    }
}
