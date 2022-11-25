//
//  APISettings.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

struct APISettings : Codable{
    
    var apiKey: String
    
    var endPoints : EndPoints
    
    struct EndPoints : Codable{
        var apod: EndpointConfig
        
        struct EndpointConfig: Codable{
            var scheme : String
            var host : String
            var path : String
        }
    }
}
