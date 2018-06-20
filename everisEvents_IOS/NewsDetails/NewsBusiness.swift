//
//  NewsBusiness.swift
//  everisEvents_IOS
//
//  Created by mac on 19/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class NewsBusiness {
    func getNewsScreen(completion: @escaping (_ newsDetails:[CellBaseProtocol]) -> ()){
        var newsDetails = [CellBaseProtocol]()
        
        let apiCallNews = "http://localhost:1337/news"
        let dateFormatter = DateFormatter()

        
        
        Alamofire.request(apiCallNews).responseJSON() { response in //Event Request
            
            
            if let value = response.result.value {
                
                let json = JSON(value)
                
                    
                    let title = json[0]["Title"].stringValue
                    let imageURL = json[0]["Image"]["url"].stringValue
                    let description = json[0]["Description"].stringValue
                    let date  = json[0]["Date"].stringValue
                
                
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                let dateEvent  = dateFormatter.date(from: date) //String to date
                dateFormatter.dateFormat = "yyyy-MM-dd" //month from date
                let dateDetail = dateFormatter.string(from: dateEvent!) //date to string
                    
                    newsDetails.append(CellNewsDetailTitle(cellLabel: title, cellImage: imageURL))
                    newsDetails.append(CellNewsDetailDesc(cellLabel: description, cellDate: dateDetail))
                
                
                    completion (newsDetails)
                    
            }
        }
    }
}
