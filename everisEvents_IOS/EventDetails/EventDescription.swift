//
//  EventDescription.swift
//  everisEvents_IOS
//
//  Created by mac on 22/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class EventDescription: UITableViewCell {

    @IBOutlet weak var finalDate: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var eventType: UILabel!
   
    @IBOutlet weak var eventDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(initialDate: String,endDate: String, description: String,type:String){
        startDate.text = initialDate
        finalDate.text = endDate
        eventType.text = type
        eventDescription.text = description
        
    }
}
