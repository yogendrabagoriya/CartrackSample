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
    
    func createUserRecord(){
        self.repository?.saveRecordIfEmpty()
    }
    
    func verifyCredentials(credentials: Dictionary<String, String>) {
        main.async {
            let result = self.repository?.verifyCredentials(credentials: credentials)
            if result == true{
                self.presenter?.validCredential()
            }else{
                let errorAlert = AlertInfo(title: "Error", message: "Invalid Credentials. Please try again")
                self.presenter?.inValidCredentials(info: errorAlert)
            }
        }
    }
}
