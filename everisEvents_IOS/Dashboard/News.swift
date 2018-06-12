//
//  LabelWImage.swift
//  EverisEvents
//
//  Created by macbook on 21/05/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit
import SDWebImage

class News: UITableViewCell {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(title: String, description: String, imageName: String){
        newsTitle.text = title
        newsDescription.text = description
        
        let url = URL(string: "http://localhost:1337" + imageName)
        newsImage.sd_setImage(with: url, placeholderImage: UIImage(named: "office"))
    
    }
    
}
