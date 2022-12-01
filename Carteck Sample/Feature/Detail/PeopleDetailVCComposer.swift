//
//  PeopleDetailVCComposer.swift
//  Carteck Sample
//
//  Created by Apple on 02/12/22.
//

import Foundation
import UIKit

struct PeopleDetailVCComposer{
    static func makePeopleDetailVC(userElement: UserElement) -> (UIViewController) {

        let vc = PeopleDetailViewController(userElement: userElement)
        return vc
    }
}
