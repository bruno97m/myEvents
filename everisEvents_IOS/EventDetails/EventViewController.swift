//
//  EventViewController.swift
//  everisEvents_IOS
//
//  Created by mac on 20/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
 
    @IBOutlet weak var tableEvent: UITableView!
    
    var eventBusiness = EventBusiness ()
    
    var eventDetails = [CellBaseProtocol] ()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("test")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventDetails[indexPath.row].buildCell(indexPath: indexPath, tableview: tableEvent)
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableEvent.delegate = self
        tableEvent.dataSource = self
        
        tableEvent.register(UINib(nibName: "EventTitle", bundle: nil), forCellReuseIdentifier: "EventTitle")
        tableEvent.register(UINib(nibName: "EventDescription", bundle: nil), forCellReuseIdentifier: "EventDescription")
        
        eventBusiness.getEventScreen(completion: {(eventDetails : [CellBaseProtocol])-> Void in
            self.eventDetails = eventDetails
            self.tableEvent.reloadData()
        })
        
    }
    
}

