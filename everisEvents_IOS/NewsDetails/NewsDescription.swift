//
//  NewsDescription.swift
//  everisEvents_IOS
//
//  Created by mac on 20/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class NewsDescription: UITableViewCell {

    @IBOutlet weak var Description: UITextView!
    @IBOutlet weak var Date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUp(description: String,date: String){
        Description.text = description
        Date.text = date
        
    }
}
