//
//  LoadingBehavior.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation
import UIKit
import NVActivityIndicatorView

/**
    This protocol confirms showing loading
 */
protocol LoadingBehavior : NVActivityIndicatorViewable{
    func showLoading()
    func hideLoading()
}

extension LoadingBehavior where Self : UIViewController{
    func showLoading(){
        view?.endEditing(true)
        startAnimating()
    }
    
    func hideLoading(){
        stopAnimating()
    }
}
