//
//  UserParser.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

protocol UserParser{
    func parseUser(_ data: Data, from response: HTTPURLResponse) throws -> (People)
}
