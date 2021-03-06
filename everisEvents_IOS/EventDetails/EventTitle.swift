//
//  EventTitle.swift
//  everisEvents_IOS
//
//  Created by mac on 22/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class EventTitle: UITableViewCell {

    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUp(title: String,imageName: String){
        eventTitle.text = title
        eventImage.image = UIImage (named: imageName)
      
        let url = URL(string: "http://localhost:1337" + imageName)
        eventImage.sd_setImage(with: url, placeholderImage: UIImage(named: "logoeveris"))
    }
    
}
