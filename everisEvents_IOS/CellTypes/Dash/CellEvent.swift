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
    var cellObject : CellEventObject!
    
    
    
    init(cellImage: String, cellTitle: String, cellDescription: String, cellDay: String, cellMonth: String, cellStartDate: String, cellEndDate: String) {
        super.init(ID: cellId)
        self.cellObject = CellEventObject(cellImage: cellImage, cellTitle: cellTitle, cellDescription: cellDescription, cellDay: cellDay, cellMonth: cellMonth, cellStartDate: cellStartDate, cellEndDate: cellEndDate)
        self.heigth = 97
    }
    
    
    
    override func buildCell(indexPath: IndexPath, tableview: UITableView) -> UITableViewCell{
        
        let cell = super.buildCell(indexPath: indexPath, tableview: tableview) as! EventDash
        cell.setUp(title: cellObject.cellTitle, description: cellObject.cellDescription, imageName: cellObject.cellImage, day: cellObject.cellDay, month: cellObject.cellMonth, startDate: cellObject.cellStartDate, endDate: cellObject.cellEndDate)
        return cell
    }
}

class CellEventObject {
    var cellImage: String!
    var cellTitle: String!
    var cellDescription: String!
    var cellDay: String!
    var cellMonth: String!
    var cellStartDate: String!
    var cellEndDate: String!
    
    
    init(cellImage: String, cellTitle: String, cellDescription: String, cellDay: String, cellMonth: String, cellStartDate: String, cellEndDate:String) {
        
        self.cellTitle = cellTitle
        self.cellImage = cellImage
        self.cellDescription = cellDescription
        self.cellDay = cellDay
        self.cellMonth = cellMonth
        self.cellStartDate = cellStartDate
        self.cellEndDate = cellEndDate
      
    }
    
}
    
    

