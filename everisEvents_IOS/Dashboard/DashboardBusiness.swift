//
//  Dashboard.swift
//  EverisEvents
//
//  Created by macbook on 16/05/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SDWebImage

class DashBoardBusiness {
    func getDashArray(completion: @escaping (_ dashArray:[[CellBaseProtocol]]) -> ()){
         var dashArray = [[CellBaseProtocol](),[CellBaseProtocol]()]
       
        let imageview = UIImageView()
        let apiCallEvent = "http://localhost:1337/event"
        let apiCallNews = "http://localhost:1337/news"
        
        let dateFormatter = DateFormatter()
       // formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" //2017-04-01T18:05:00.000
       // let date1  = formatter.date(from: "2017-04-01T18:05:00.000Z")
      //  formatter.dateFormat = "LLLL"
      //  let resultTime = formatter.string(from: date1!)
        //print(resultTime)
        
       
        
        Alamofire.request(apiCallEvent).responseJSON() { response in //Event Request
            
            
            if let value = response.result.value {
                
                let json = JSON(value)
               
                
                for item in json.arrayValue {
                  
                    let title = item["Title"].stringValue
                    let description = item["Description"].stringValue
                    let StringEvent  = item["Initial date"].stringValue
                    
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                    let dateEvent  = dateFormatter.date(from: StringEvent) //String to date
                    dateFormatter.dateFormat = "LLLL" //month from date
                    let monthEvent = dateFormatter.string(from: dateEvent!) //date to string
                    dateFormatter.dateFormat = "d" //day from date
                    let dayEvent = dateFormatter.string(from: dateEvent!)
              
                    
                    
        
                    dashArray[0].append(CellEvent(cellImage: "nil", cellTitle: title, cellDescription: description, cellDay: dayEvent, cellMonth: monthEvent))
                
                }
        
        
         Alamofire.request(apiCallNews).responseJSON() { response in    //News Request
                    
                    
            if let value = response.result.value {
                        
                let json = JSON(value)
                        
                for item in json.arrayValue {
                            
                    let title = item["Title"].stringValue
                    let description = item["Description"].stringValue
                    let imageURL = item["Image"]["url"].stringValue
                    
                    dashArray[1].append(CellNews(cellImage: imageURL, cellTitle: title, cellDescription: description))
                }
            
      
                completion(dashArray)
                
            }
        }
            
        }
        
    }
    
}
}
