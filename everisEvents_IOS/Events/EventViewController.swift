//
//  ViewController.swift
//  EverisEvents
//
//  Created by macbook on 02/05/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit
import Alamofire


class EventViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    
    var cellArray: [CellBaseProtocol]?

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cellArray = cellArray {
            return cellArray.count
        }else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellArray![indexPath.row].buildCell(indexPath: indexPath, tableview: tableview)
        return cell
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let parameters: Parameters =
            ["Titulo":"Evento everis"]
        
     
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "MyLabel" , bundle: nil), forCellReuseIdentifier: "MyLabel")
        tableview.register(UINib(nibName: "MyImage" , bundle: nil), forCellReuseIdentifier: "MyImage")
        
        
      
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

