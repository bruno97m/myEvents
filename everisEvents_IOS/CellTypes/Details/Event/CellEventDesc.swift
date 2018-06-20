//
//  CellNewsDDescription.swift
//  everisEvents_IOS
//
//  Created by mac on 20/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

class CellEventDesc : CellBase {
    
    let cellId = "EventDescription"
    var cellInitialDate: String!
    var cellFinalDate: String!
    var cellDescription : String!
    var cellEventType : String!
    
    init(cellInitialDate: String, cellFinalDate: String, cellDescription: String, cellEventType: String) {
        super.init(ID: cellId)
        self.cellInitialDate = cellInitialDate
        self.cellFinalDate = cellFinalDate
        self.cellDescription = cellDescription
        self.cellEventType = cellEventType
        
        self.heigth = 400
    }
    
    override func buildCell(indexPath: IndexPath, tableview: UITableView) -> UITableViewCell{
        
        let cell = super.buildCell(indexPath: indexPath, tableview: tableview) as! EventDescription
    
        return cell
    }
    
    
}
