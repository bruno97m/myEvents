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
    
    @IBOutlet weak var tableNews: UITableView!
    
    var newsBusiness = NewsBusiness ()
    
    var newsDetails = [CellBaseProtocol] ()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsDetails[indexPath.row].buildCell(indexPath: indexPath, tableview: tableNews)
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableNews.delegate = self
        tableNews.dataSource = self
       
        tableNews.register(UINib(nibName: "NewsTitle", bundle: nil), forCellReuseIdentifier: "NewsTitle")
        tableNews.register(UINib(nibName: "NewsDescription", bundle: nil), forCellReuseIdentifier: "NewsDescription")
        
        newsBusiness.getNewsScreen(completion: {(newsDetails : [CellBaseProtocol])-> Void in
            self.newsDetails = newsDetails
            self.tableNews.reloadData()
        })
        
    }

}
