//
//  CellBase.swift
//  everisEvents_IOS
//
//  Created by macbook on 08/05/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import Foundation
import UIKit

class CellBase: CellBaseProtocol{
    var heigth: Int!
    var ID: String!
    
    func buildCell(indexPath: IndexPath, tableview: UITableView) -> UITableViewCell{
        return tableview.dequeueReusableCell(withIdentifier: ID, for: indexPath)
    }
    
    init(ID: String) {
        self.ID = ID
        self.heigth = 100 
    }

    
    
}

protocol CellBaseProtocol {
    var ID: String! {get set}
    var heigth : Int! {get set}
    func buildCell(indexPath: IndexPath, tableview:UITableView) -> UITableViewCell
}
