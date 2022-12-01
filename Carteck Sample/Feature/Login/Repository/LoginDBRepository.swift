//
//  LoginDBRepository.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

protocol LoginDBRepository{
    func verifyCredentials(credentials: Dictionary<String, String>)->(Bool)
}
