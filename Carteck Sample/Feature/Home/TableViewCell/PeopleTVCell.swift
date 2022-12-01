//
//  PeopleTVCell.swift
//  Carteck Sample
//
//  Created by Apple on 01/12/22.
//

import Foundation
import UIKit

class PeopleTVCell: UITableViewCell{
    @IBOutlet private weak var nameL: UILabel!
    
    func confinureUI(userElement: UserElement){
        self.nameL.text = userElement.name
    }
}
