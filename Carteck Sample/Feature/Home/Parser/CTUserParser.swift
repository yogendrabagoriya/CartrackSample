//
//  CSUserParser.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

public enum APIError: Swift.Error {
    case invalidData
}

struct CTUserParser: UserParser{
    
    func parseUser(_ data: Data, from response: HTTPURLResponse) throws -> (People){
        
        guard response.isOK, let apod = try? JSONDecoder().decode(People.self, from: data) else {
            throw APIError.invalidData
        }
        
        return apod
    }
}
