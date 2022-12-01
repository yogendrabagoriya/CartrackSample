//
//  LoginVCViewModel.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

protocol LoginVCPresenter: AnyObject{
    func validCredential()
    func inValidCredentials(info: AlertInfo)
}

class LoginVCViewModel{
    var repository: LoginDBRepository?
    weak var presenter: LoginVCPresenter?
    
    init(repository: LoginDBRepository){
        self.repository = repository
    }
}


extension LoginVCViewModel: LoginVCViewModelProtocol{
    func verifyCredentials(credentials: Dictionary<String, String>) {
        self.presenter?.validCredential()
    }
}
