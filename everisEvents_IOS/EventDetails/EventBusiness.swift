//
//  EventBusiness.swift
//  everisEvents_IOS
//
//  Created by mac on 20/06/18.
//  Copyright © 2018 mac. All rights reserved.
//


import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class EventBusiness {
    func getEventScreen(completion: @escaping (_ eventDetails:[CellBaseProtocol]) -> ()){
        var eventDetails = [CellBaseProtocol]()
        
        let apiCallEvent = "http://localhost:1337/event"
        let dateFormatter = DateFormatter()
        
        Alamofire.request(apiCallEvent).responseJSON() { response in //Event Request
            
            if let value = response.result.value {
                
                let json = JSON(value)
                
                let title = json[0]["Title"].stringValue
                let description = json[0]["Description"].stringValue
                let eventType = json[0]["Event Type"].stringValue
                let initialString  = json[0]["Initial date"].stringValue
                let finalString  = json[0]["Final Date"].stringValue
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                let fDateEvent  = dateFormatter.date(from: initialString) //String to date
                let iDateEvent  = dateFormatter.date(from: finalString) //String to date
                dateFormatter.dateFormat = "yyyy-MM-dd" //month from date
                let idateDetail = dateFormatter.string(from: iDateEvent!) //date to string
                let fdateDetail = dateFormatter.string(from: fDateEvent!)
         
                eventDetails.append(CellEventTitle(cellLabel: title, cellImage:"nil"))
                eventDetails.append(CellEventDesc(cellInitialDate: idateDetail, cellFinalDate: fdateDetail, cellDescription: description, cellEventType: eventType))
                
                completion (eventDetails)
                
            }
        }
    }
}
