//
//  UserAPI.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

protocol PeopleAPI: AnyObject{
    typealias Result = APIResult<People>
    typealias Completion = ((Result)->())
    
    func fetchPeoples(queryParam: [String: String], completion: @escaping Completion)
}
