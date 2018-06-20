//
//  NewsScreen.swift
//  everisEvents_IOS
//
//  Created by mac on 18/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class NewsTitle: UITableViewCell {

    @IBOutlet weak var titleDetails: UILabel!
    @IBOutlet weak var imageDetails: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(title: String,imageName: String){
        titleDetails.text = title
        imageDetails.image = UIImage(named: imageName)
        
        let url = URL(string: "http://localhost:1337" + imageName)
        imageDetails.sd_setImage(with: url, placeholderImage: UIImage(named: "office"))
    }
    
}
