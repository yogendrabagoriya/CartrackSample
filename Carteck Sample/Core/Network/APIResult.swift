//
//  APIResult.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

enum APIResult<T>{
    case success(T)
    case failure(AlertInfo)
}
