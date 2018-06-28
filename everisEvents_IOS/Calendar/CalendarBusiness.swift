//
//  CalendarBusiness.swift
//  everisEvents_IOS
//
//  Created by mac on 16/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CalendarBusiness {
   
    func getEventDate(completion: @escaping (_ eventDate:[String]) -> ()){
         var eventDate = [String]()
        
         let apiCallEvent = "http://localhost:1337/event"
         let dateFormatter = DateFormatter()
        
        Alamofire.request(apiCallEvent).responseJSON() { response in //Event Request
            
            
            if let value = response.result.value {
                
                let json = JSON(value)
                
                
                for item in json.arrayValue {
                    
                    let StringEvent = item["Start Date"].stringValue
                    
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                    let dateEvent  = dateFormatter.date(from: StringEvent)
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let events = dateFormatter.string(from: dateEvent!)
                    
                    eventDate.append(events)
                    
                    
                    completion (eventDate)
                    
                }
            }
        }
    }
    
    func getCalendarEventsByDate(date: Date ,completion: @escaping (_ calendarEvents:[CellBaseProtocol]) -> ()){
        var calendarEvents = [CellBaseProtocol] ()
        
        let apiCallEvent = "http://localhost:1337/event"
        Alamofire.request(apiCallEvent).responseJSON() { response in //Event Request
            
            if let value = response.result.value {
                
                let json = JSON(value)
                for item in json.arrayValue {
                    let title = item["Title"].stringValue
                    let description = item["Description"].stringValue
                    
                    let StringStartDate  = item["Start Date"].stringValue
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                    let startDateEvent  = dateFormatter.date(from: StringStartDate) //String to date
                    dateFormatter.dateFormat = "LLLL" //month from date
                    let monthEvent = dateFormatter.string(from: startDateEvent!) //date to string
                    dateFormatter.dateFormat = "d" //day from date
                    let dayEvent = dateFormatter.string(from: startDateEvent!)
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let fullStartDate = dateFormatter.string(from: startDateEvent!)
                    
                    let StringEndDate  = item["End Date"].stringValue
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                    let endDateEvent  = dateFormatter.date(from: StringEndDate) //String to date
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let fullEndDate = dateFormatter.string(from: endDateEvent!)
                    
                    if(startDateEvent == date){
                        calendarEvents.append(CellEvent(cellImage: "", cellTitle: title, cellDescription: description, cellDay: dayEvent, cellMonth: monthEvent, cellStartDate: fullStartDate, cellEndDate: fullEndDate ))
                    }
                }
                completion(calendarEvents)
            }
        }
    }
}
