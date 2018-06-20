//
//  CellEventTitle.swift
//  everisEvents_IOS
//
//  Created by mac on 20/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

class CellEventTitle : CellBase {
    
    let cellId = "EventTitle"
    var cellLabel: String!
    var cellImage: String!
    
    init(cellLabel: String, cellImage: String) {
        super.init(ID: cellId)
        self.cellLabel = cellLabel
        self.cellImage = cellImage
        
        self.heigth = 300
    }
    
    override func buildCell(indexPath: IndexPath, tableview: UITableView) -> UITableViewCell{
        
        let cell = super.buildCell(indexPath: indexPath, tableview: tableview) as! EventTitle
        cell.setUp(title: cellLabel, imageName: cellImage)
        
        
        return cell
    }
    
    
}
