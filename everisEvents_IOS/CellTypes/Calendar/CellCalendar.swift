//
//  CellCalendar.swift
//  everisEvents_IOS
//
//  Created by mac on 20/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

class CellCalendar: CellBase {
    
    let cellId = "CalendarEventT"
    var cellImage: String!
    var cellLabel: String!
    
    init(cellImage: String, cellLabel: String) {
        super.init(ID: cellId)
        self.cellImage = cellImage
        self.cellLabel = cellLabel
        
        self.heigth = 200
    }
    
    override func buildCell(indexPath: IndexPath, tableview: UITableView) -> UITableViewCell{
        
        let cell = super.buildCell(indexPath: indexPath, tableview: tableview) as! CalendarEventT
        cell.setUp(imageEvent: cellImage, title: cellLabel)
        
        
        return cell
    }
    
    
}
