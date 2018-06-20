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
                    
                    let StringEvent  = item["Initial date"].stringValue
                    
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
                    let inicialDate  = item["Initial date"].stringValue
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                    let dateEvent  = dateFormatter.date(from: inicialDate) //String to date
                    if(dateEvent == date){
                        calendarEvents.append(CellCalendar(cellImage: "logoeveris", cellLabel: title))
                    }
                }
                completion(calendarEvents)
            }
        }
    }
}
