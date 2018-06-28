//
//  DashboardViewController.swift
//  EverisEvents
//
//  Created by macbook on 16/05/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableviewDash: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
  
    var dashboardBusiness = DashBoardBusiness()
    let headerTitles = ["Próximos Eventos", "Notícias"]
    var dashArray = [[CellBaseProtocol](),[CellBaseProtocol]()]
    var selectedItem : CellBaseProtocol?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dashArray.count
    }
    
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return CGFloat(dashArray[indexPath.section][indexPath.row].heigth)
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lastRow = tableView.numberOfRows(inSection: 0) - 1 // get last row on event section

        selectedItem = self.dashArray[indexPath.section][indexPath.row]

        if  (indexPath.section == 0 && indexPath.row == lastRow) {
            performSegue(withIdentifier: "showCalendar", sender: self)
        }
        
        if  (indexPath.section == 0 && !(indexPath.row == lastRow)) {
            performSegue(withIdentifier: "showEventDetail", sender: self)
        }
        
        if (indexPath.section == 1){
          performSegue(withIdentifier: "showNewsDetail", sender: self)
        }
        
        tableView.deselectRow(at: indexPath, animated: true) // Deselect when we select row
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNewsDetail" {
            let detailNewsVC = segue.destination as? NewsViewController
            detailNewsVC?.selectedItem = (selectedItem as! CellNews).cellObject
        }
        
        if segue.identifier == "showEventDetail" {
            let detailEventVC = segue.destination as? EventViewController
            detailEventVC?.selectedItem = (selectedItem as! CellEvent).cellObject
            //TODO
            //detailEventVC?.selectedItem = selectedItem as! CellEvent

            
        }
        
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashArray[section].count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dashArray[indexPath.section][indexPath.row].buildCell(indexPath: indexPath, tableview: tableviewDash)
        return cell
    }
 
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let nav = self.navigationController?.navigationBar
        let navColor = UIColor(red: 156.0/255.0, green: 174.0/255.0, blue: 4.0/255.0, alpha: 1.0)
        nav?.barTintColor = navColor //nav bar background color
        let attributes = [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Bold", size: 30)!, NSAttributedStringKey.foregroundColor: UIColor.white ] //nav bar font and color
        nav?.titleTextAttributes = attributes

        tableviewDash.delegate = self
        tableviewDash.dataSource = self
        tableviewDash.register(UINib(nibName: "News", bundle: nil), forCellReuseIdentifier: "News")
        tableviewDash.register(UINib(nibName: "EventDash", bundle: nil), forCellReuseIdentifier: "EventDash")
        tableviewDash.register(UINib(nibName: "EventCalendar", bundle: nil), forCellReuseIdentifier: "EventCalendar")
       
        tableviewDash.alpha = 0
      
        dashboardBusiness.getDashArray(completion: {(dashArray : [[CellBaseProtocol]])-> Void in
            self.dashArray = dashArray
            self.tableviewDash.reloadData()
            self.tableviewDash.alpha = 1
            self.activityIndicator.alpha = 0
        })
        
      

    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
