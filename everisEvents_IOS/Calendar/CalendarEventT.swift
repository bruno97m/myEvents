//
//  CalendarEventT.swift
//  everisEvents_IOS
//
//  Created by mac on 20/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class CalendarEventT: UITableViewCell {

    @IBOutlet weak var titleEvent: UILabel!
    @IBOutlet weak var imageLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUp(imageEvent: String, title: String ){
        imageLogo.image = UIImage(named: imageEvent)
        titleEvent.text = title
        
        
    }
}
