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
        let dateFormatter = DateFormatter()
        var arraymm = [String]()
 
    
        
        let apiCallEvent = "http://localhost:1337/event"
        Alamofire.request(apiCallEvent).responseJSON() { response in //Event Request
            if let value = response.result.value {
                
                let json = JSON(value)
                for item  in json.arrayValue {
                    let title = item["Title"].stringValue
                    let description = item["Description"].stringValue
                    let StringDateEvent  = item["Start Date"].stringValue
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                    let dateEvent  = dateFormatter.date(from: StringDateEvent) //String to date
                    dateFormatter.dateFormat = "LLLL" //month from date
                    let monthEvent = dateFormatter.string(from: dateEvent!) //date to string
                    dateFormatter.dateFormat = "d" //day from date
                    let dayEvent = dateFormatter.string(from: dateEvent!)
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let fullDate = dateFormatter.string(from: dateEvent!)
                    
                    let StringEndDate  = item["End Date"].stringValue
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                    let endDateEvent  = dateFormatter.date(from: StringEndDate) //String to date
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let fullEndDate = dateFormatter.string(from: endDateEvent!)
                    
                    dashArray[0].append(CellEvent(cellImage: "nil", cellTitle: title, cellDescription: description, cellDay: dayEvent, cellMonth: monthEvent, cellStartDate: fullDate, cellEndDate: fullEndDate))
                    print(arraymm)
                }
            
            
                let apiCallNews = "http://localhost:1337/news"
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


