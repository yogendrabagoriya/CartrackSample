//
//  HTTPURLResponseExt.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }
    
    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
