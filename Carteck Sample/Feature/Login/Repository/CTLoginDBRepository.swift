//
//  CTLoginDBRepository.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

class CTLoginDBRepository: LoginDBRepository{
    
    func verifyCredentials(credentials: Dictionary<String, String>)->(Bool) {
        return true
    }
}
