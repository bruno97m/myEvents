//
//  CellEvent.swift
//  everisEvents_IOS
//
//  Created by macbook on 25/05/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import Foundation
import UIKit

class CellEvent : CellBase {
    
    let cellId = "EventDash"
    var cellImage: String!
    var cellTitle: String!
    var cellDescription: String!
    var cellDay: String!
    var cellMonth: String!
    
    
    init(cellImage: String, cellTitle: String, cellDescription: String, cellDay: String, cellMonth: String) {
        super.init(ID: cellId)
        self.cellTitle = cellTitle
        self.cellImage = cellImage
        self.cellDescription = cellDescription
        self.cellDay = cellDay
        self.cellMonth = cellMonth
        self.heigth = 97
    }
    
    
    
    override func buildCell(indexPath: IndexPath, tableview: UITableView) -> UITableViewCell{
        
        let cell = super.buildCell(indexPath: indexPath, tableview: tableview) as! EventDash
        cell.setUp(title: cellTitle, description: cellDescription, imageName: cellImage, day: cellDay, month: cellMonth)
        return cell
    }
}

    
    

