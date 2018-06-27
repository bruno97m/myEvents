//
//  EventViewController.swift
//  everisEvents_IOS
//
//  Created by mac on 22/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class EventViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableEvent: UITableView!
   
    var selectedItem : CellEventObject?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableEvent.delegate = self
        tableEvent.dataSource = self
        
        tableEvent.register(UINib(nibName: "EventTitle", bundle: nil), forCellReuseIdentifier: "EventTitle")
        tableEvent.register(UINib(nibName: "EventDescription", bundle: nil), forCellReuseIdentifier: "EventDescription")
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0) {
            let cell = tableEvent.dequeueReusableCell(withIdentifier: "EventTitle", for: indexPath) as! EventTitle
            cell.setUp(title: selectedItem!.cellTitle, imageName: selectedItem!.cellImage)
            return cell
        }
        let cell = tableEvent.dequeueReusableCell(withIdentifier: "EventDescription", for: indexPath) as! EventDescription
        cell.setUp(initialDate: "", endDate: "", description: selectedItem!.cellDescription, type: "")
        return cell
    }
    
   
}
