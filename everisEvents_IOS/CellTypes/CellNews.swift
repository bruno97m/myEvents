//
//   CellLabelWImage.swift
//  everisEventsIOS
//
//  Created by macbook on 21/05/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import Foundation
import UIKit

class CellNews: CellBase {
    
    let cellId = "News"
    var cellImage: String!
    var cellTitle: String!
    var cellDescription: String!
    
    init(cellImage: String, cellTitle: String, cellDescription: String) {
        super.init(ID: cellId)
        self.cellTitle = cellTitle
        self.cellImage = cellImage
        self.cellDescription = cellDescription
        
        self.heigth = 190 
    
    }
    
    
    
    override func buildCell(indexPath: IndexPath, tableview: UITableView) -> UITableViewCell{
        
        let cell = super.buildCell(indexPath: indexPath, tableview: tableview) as! News
        cell.setUp(title: cellTitle, description: cellDescription, imageName: cellImage)
        
       
        return cell
    }
}
