//
//  HomeVCViewModel.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

protocol HomeVCPresenter: AnyObject{
//    func apodHandler(apod: Apod)
//    func failureHandler(info: AlertInfo)
}

class HomeVCViewModel{
    
    var api: UserAPI?
    weak var presenter: HomeVCPresenter?
    
    init(api: UserAPI){
        self.api = api
    }
}


extension HomeVCViewModel: HomeVCViewModelProtocol{
    func fetchPictureOfDay() {
        /*
        self.api?.getPicture(body: [:], completion: {[weak self] result in
            switch result{
            case .success(let apod):
                self?.presenter?.apodHandler(apod: apod)
                
            case .failure(let info):
                self?.presenter?.failureHandler(info: info)
            }
        })
        */
    }
}
