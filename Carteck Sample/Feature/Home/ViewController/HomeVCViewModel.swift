//
//  HomeVCViewModel.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

protocol HomeVCPresenter: AnyObject{
    func peopleHandler(peoples: People)
    func failureHandler(info: AlertInfo)
}

class HomeVCViewModel{
    
    var api: PeopleAPI?
    weak var presenter: HomeVCPresenter?
    
    init(api: PeopleAPI){
        self.api = api
    }
}


extension HomeVCViewModel: HomeVCViewModelProtocol{
    func fetchPeople() {
        self.api?.fetchPeoples(queryParam: [:], completion: {[weak self] result in
            switch result{
            case .success(let peoples):
                self?.presenter?.peopleHandler(peoples: peoples)
                
            case .failure(let info):
                self?.presenter?.failureHandler(info: info)
            }
        })
        
    }
}
