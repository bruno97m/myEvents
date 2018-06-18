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
       
        
        let apiCallEvent = "http://localhost:1337/event"
        let apiCallNews = "http://localhost:1337/news"
        
        let dateFormatter = DateFormatter()

    
        
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
            
                dashArray[0].append(CellEventCalendar(cellImage: "calendar", cellLabel: "Ver todos os eventos"))
                completion(dashArray)
            }
                }
            }
        }
    }
}
                

