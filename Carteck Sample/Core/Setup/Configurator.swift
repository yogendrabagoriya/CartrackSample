//
//  Configurator.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

protocol APIConfiguratorP{
    func getAPISettings()->(APISettings?)
}


class Configurator: APIConfiguratorP{

    /**
        This will pick different APISetting file ased on current schema's build configuration
     */
    func getAPISettings() -> (APISettings?) {
        let name = Bundle.main.object(forInfoDictionaryKey: "APISettingsFile") as? String
        return try? APISettings.from(plistNamed: name!)
    }
}
