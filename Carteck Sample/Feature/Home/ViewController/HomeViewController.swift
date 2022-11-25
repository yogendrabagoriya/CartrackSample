//
//  ViewController.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import UIKit

protocol HomeVCViewModelProtocol{
    
}

class HomeViewController: NibViewController {

    private var viewModel: HomeVCViewModelProtocol?
    
    //MARK: - Life cycle methods
    init(viewModel: HomeVCViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


extension HomeViewController: HomeVCPresenter{
    
}

