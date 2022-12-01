//
//  UserEndPoint.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

struct UserEndPoint{
    
    static func getUserEndpoint(querParam: [String: String]) -> Endpoint {
        let config = AppSetup.shared.apiSetting!.endPoints.user
        
        let ep = Endpoint(scheme: config.scheme,
                          host: config.host,
                          path: config.path,
                          queryItem: querParam)
        return ep
        
    }
}
