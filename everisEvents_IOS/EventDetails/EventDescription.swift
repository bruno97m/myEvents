//
//  NewsDescription.swift
//  everisEvents_IOS
//
//  Created by mac on 20/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class EventDescription: UITableViewCell {

    @IBOutlet weak var initialDate: UILabel!
    
    @IBOutlet weak var finalDate: UILabel!
    
    @IBOutlet weak var Description: UITextView!

    @IBOutlet weak var eventType: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUp(iniDate: String,finDate: String,description: String,type: String){
        initialDate.text = iniDate
        finalDate.text = finDate
        Description.text = description
        eventType.text = type
        
    }
}
