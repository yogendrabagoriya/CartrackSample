//
//  UITableViewCellExt.swift
//  Carteck Sample
//
//  Created by Apple on 01/12/22.
//

import Foundation
import UIKit

extension UITableViewCell{
    static var identifier: String{
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}
