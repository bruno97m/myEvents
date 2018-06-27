//
//  CellEventDesc.swift
//  everisEvents_IOS
//
//  Created by mac on 22/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

class CellEventDesc: CellBase {
    let cellId = "EventDescription"
    var cellDescription: String!
    var cellStartDate: String!
    var cellEndDate: String!
    var cellEventType: String!
    
    
    
    init(cellDescription: String, cellStartDate: String, cellEndDate: String, cellEventType: String) {
        super.init(ID: cellId)
        self.cellDescription = cellDescription
        self.cellStartDate = cellStartDate
        self.cellEndDate = cellEndDate
        self.cellEventType = cellEventType
        
        self.heigth = 400
    }
    
    override func buildCell(indexPath: IndexPath, tableview: UITableView) -> UITableViewCell{
        
        let cell = super.buildCell(indexPath: indexPath, tableview: tableview) as! EventDescription
        cell.setUp(initialDate: cellStartDate, endDate: cellEndDate, description: cellDescription, type: cellEventType)
        return cell
    }
    
    
}

        

