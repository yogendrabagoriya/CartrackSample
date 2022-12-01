//
//  UITableViewExt.swift
//  Carteck Sample
//
//  Created by Apple on 01/12/22.
//

import Foundation
import UIKit

extension UITableView{
    func register<T: UITableViewCell>(_ type: T.Type){
        register(UINib(nibName: T.identifier, bundle: Bundle(for: type)), forCellReuseIdentifier: T.identifier)
    }
    
    public func dequeue<T: UITableViewCell>(type: T.Type) -> T? {
        return dequeueReusableCell (withIdentifier: type.identifier) as? T
    }
    
    public func reloadAllSections (animation: UITableView.RowAnimation = .automatic){
        reloadSections(IndexSet(0..<numberOfSections), with: animation)
    }
}
