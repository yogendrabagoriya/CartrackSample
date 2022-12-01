//
//  CTUserAPI.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

//public enum APIError: Swift.Error {
//    case invalidData
//}

class CTPeopleAPI: PeopleAPI{
    
    var networkManager: NetworkClient
    var parser: UserParser
    
    init(networkManager: NetworkClient, parser: UserParser){
        self.networkManager = networkManager
        self.parser = parser
    }
}

extension CTPeopleAPI{
    func fetchPeoples(queryParam: [String: String], completion: @escaping Completion) {
        let endPoint = UserEndPoint.getUserEndpoint(querParam: queryParam)
        self.networkManager.get(from: endPoint.url.url!) {[weak self] result in
            switch result{
                
            case .success((let data, let response)):
                do{
                    if let user = try self?.parser.parseUser(data, from: response){
                        completion(.success(user))
                    }
                    
                }catch (let error){
                    completion(.failure(.gerneralisedAlertInfo(error: error)))
                }
                
            case .failure(let error):
                completion(.failure(.gerneralisedAlertInfo(error: error)))
            }
        }
    }
}
