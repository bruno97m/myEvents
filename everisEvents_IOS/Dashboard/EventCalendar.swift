//
//  CalendarButton.swift
//  everisEvents_IOS
//
//  Created by mac on 14/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class EventCalendar: UITableViewCell {

    @IBOutlet weak var CalendarIcon: UIImageView!
    @IBOutlet weak var CalendarLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUp(imageCalendar: String, labelCalendar: String ){
        CalendarIcon.image = UIImage(named: imageCalendar)
        CalendarLabel.text = labelCalendar
        
        
    }
  
}
