//
//  UserAPI.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

protocol UserAPI: AnyObject{
    typealias Result = APIResult<People>
    typealias Completion = ((Result)->())
    
    func getPicture(queryParam: [String: String], completion: @escaping Completion)
}
