//
//  LoginViewController.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation
import UIKit

protocol LoginVCViewModelProtocol{
    func createUserRecord()
    func verifyCredentials(credentials: Dictionary<String, String>)
}

class LoginViewController: NibViewController{
    
    @IBOutlet private weak var userNameTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var countryTF: UITextField!
    
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
        self.viewModel?.createUserRecord()
    }
    
    @IBAction func loginButtonAction(sender : UIButton){
        self.view.endEditing(true)
        
        let userName = self.userNameTF.text ?? ""
        let password = self.passwordTF.text ?? ""
        let country = self.countryTF.text ?? ""
        if userName.isEmpty || password.isEmpty || country.isEmpty{
            // TODO: Implement needfull here to handle mandatory field emplty case
        }else{
            self.showLoading()
            let dataDict: Dictionary<String, String> = ["name": userName, "password": password, "country": country]
            self.viewModel?.verifyCredentials(credentials: dataDict)
        }
    }
}


extension LoginViewController: LoginVCPresenter{
    func validCredential() {
        main.async {
            self.hideLoading()
            let vc = HomeVCComposer.makeHomeVC()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .overFullScreen
            self.present(nav, animated: true)
//            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func inValidCredentials(info: AlertInfo) {
        main.async {
            self.hideLoading()
            self.showAlert(alertInfo: info)
        }
    }
}

extension LoginViewController: LoadingBehavior, AlertBehavior{}
