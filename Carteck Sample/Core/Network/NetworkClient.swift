//
//  NetworkClient.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation

protocol NetworkClient: AnyObject{
    
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Swift.Error>
    
    func get(from url: URL, completionHandler: @escaping (Result) -> Void)
    func download(from fileUrl: URL, completionHandler: @escaping (NetworkClient.Result) -> Void)
}
