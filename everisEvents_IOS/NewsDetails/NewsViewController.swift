//
//  NewsViewController.swift
//  everisEvents_IOS
//
//  Created by mac on 18/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableNews: UITableView!
    
    var selectedItem : CellNewsObject?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.allowsSelection = false
        if(indexPath.row == 0) {
            let cell = tableNews.dequeueReusableCell(withIdentifier: "NewsTitle", for: indexPath) as! NewsTitle
            cell.setUp(title: selectedItem!.cellTitle, imageName: selectedItem!.cellImage)
            return cell
        }
        let cell = tableNews.dequeueReusableCell(withIdentifier: "NewsDescription", for: indexPath) as! NewsDescription
        cell.setUp(description: selectedItem!.cellDescription, date: "")
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.white
        tableNews.delegate = self
        tableNews.dataSource = self
        tableNews.register(UINib(nibName: "NewsTitle", bundle: nil), forCellReuseIdentifier: "NewsTitle")
        tableNews.register(UINib(nibName: "NewsDescription", bundle: nil), forCellReuseIdentifier: "NewsDescription")
        self.activityIndicator.alpha = 0
        
    }

}
