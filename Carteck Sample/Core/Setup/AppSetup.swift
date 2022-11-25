//
//  AppSetup.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation
class AppSetup{
    
    static let shared = AppSetup()
    
    private init(){
        
    }
    
    private(set) var apiSetting : APISettings?

    func initialize(){
        let configurator = Configurator()
        self.apiSetting = configurator.getAPISettings()
    }
}
