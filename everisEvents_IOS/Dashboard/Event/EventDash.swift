//
//  EventDash.swift
//  everisEvents_IOS
//
//  Created by mac on 09/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class EventDash: UITableViewCell {

    @IBOutlet weak var eventEnd: UILabel!
    @IBOutlet weak var eventStart: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventDay: UILabel!
    @IBOutlet weak var eventMonth: UILabel!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
    func setUp(title: String, description: String, imageName: String, day: String, month:String, startDate: String,endDate: String){
            eventImage.image = UIImage(named: imageName)
            eventTitle.text = title
            eventDescription.text = description
            eventDay.text = day
            eventMonth.text = month
            eventImage.layer.cornerRadius = eventImage.frame.size.height/2
            eventImage.clipsToBounds = true
            eventEnd.text = endDate
            eventStart.text = startDate
            eventEnd.alpha = 0
            eventStart.alpha = 0
            
        }

    }
    

