//
//  CellEventCalendar.swift
//  everisEvents_IOS
//
//  Created by mac on 14/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

class CellEventCalendar : CellBase {
    
    let cellId = "EventCalendar"
    var cellImage: String!
    var cellLabel: String!

    init(cellImage: String, cellLabel: String) {
        super.init(ID: cellId)
        self.cellImage = cellImage
        self.cellLabel = cellLabel
    }

    override func buildCell(indexPath: IndexPath, tableview: UITableView) -> UITableViewCell{
        
        let cell = super.buildCell(indexPath: indexPath, tableview: tableview) as! EventCalendar
        cell.setUp(imageCalendar: cellImage, labelCalendar: cellLabel)
        
        
        return cell
    }


}
