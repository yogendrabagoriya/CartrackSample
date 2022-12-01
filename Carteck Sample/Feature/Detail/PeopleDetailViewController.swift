//
//  PropleDetailVC.swift
//  Carteck Sample
//
//  Created by Apple on 02/12/22.
//

import Foundation
import UIKit

class PeopleDetailViewController: NibViewController{
    
    @IBOutlet private weak var nameL: UILabel!
    @IBOutlet private weak var userNameL: UILabel!
    @IBOutlet private weak var emailL: UILabel!
    @IBOutlet private weak var phoneL: UILabel!
    @IBOutlet private weak var streetL: UILabel!
    @IBOutlet private weak var websiteL: UILabel!
    @IBOutlet private weak var companyNameL: UILabel!
    @IBOutlet private weak var catchPhraseL: UILabel!
    
    
    private var userElement: UserElement
    
    //MARK: - Life cycle methods
    init(userElement: UserElement) {
        self.userElement = userElement
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.configureUI()
    }
    
    private func configureUI(){
        self.nameL.text = userElement.name
        self.userNameL.text = userElement.username
        self.emailL.text = userElement.email
        self.phoneL.text = userElement.phone
        self.streetL.text = userElement.address.street
        self.websiteL.text = userElement.website
        self.catchPhraseL.text = userElement.company.catchPhrase
        self.companyNameL.text = userElement.company.name
    }
}
