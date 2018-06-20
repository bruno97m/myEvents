//
//  CellNewsDetailDesc.swift
//  everisEvents_IOS
//
//  Created by mac on 20/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

class CellNewsDesc : CellBase {
    
    let cellId = "NewsDescription"
    var cellLabel: String!
    var cellDate: String!
    
    init(cellLabel: String, cellDate: String) {
        super.init(ID: cellId)
        self.cellLabel = cellLabel
        self.cellDate = cellDate
        
        self.heigth = 400
    }
    
    override func buildCell(indexPath: IndexPath, tableview: UITableView) -> UITableViewCell{
        
        let cell = super.buildCell(indexPath: indexPath, tableview: tableview) as! NewsDescription
        cell.setUp(description: cellLabel, date: cellDate)
        return cell
    }
    
    
}

