//
//  CalendarViewController.swift
//  everisEvents_IOS
//
//  Created by mac on 14/06/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit
import FSCalendar



class CalendarViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableCalendar: UITableView!
    @IBOutlet weak var Calendar: FSCalendar!
    
    var calendarBusiness = CalendarBusiness ()
    var eventDate = [String]()
    var calendarEvents = [CellBaseProtocol] ()
    var selectedItem : CellBaseProtocol?
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let dateString = self.dateFormatter.string(from: date)
        
        if self.eventDate.contains(dateString) {
            calendarBusiness.getCalendarEventsByDate(date: date ,completion: {(calendarEvents : [CellBaseProtocol])-> Void in
                self.calendarEvents = calendarEvents
                self.tableCalendar.reloadData()
            })
        } else { //days with no events
            self.calendarEvents.removeAll()
            self.tableCalendar.reloadData()
        }
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateString = self.dateFormatter.string(from: date)
        
        if self.eventDate.contains(dateString) {
            return 1
        }
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = self.calendarEvents[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "showCalendarDetail", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendarEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = calendarEvents[indexPath.row].buildCell(indexPath: indexPath, tableview: tableCalendar)
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCalendarDetail" {
            let detailEventVC = segue.destination as? EventViewController
            detailEventVC?.selectedItem = (selectedItem as! CellEvent).cellObject
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.white
        
        tableCalendar.delegate = self
        tableCalendar.dataSource = self
        Calendar.delegate = self
        Calendar.dataSource = self
        tableCalendar.register(UINib(nibName: "EventDash", bundle: nil), forCellReuseIdentifier: "EventDash")
        
        tableCalendar.alpha = 0
        Calendar.alpha = 0
        calendarBusiness.getEventDate(completion: {(eventDate : [String])-> Void in
            self.eventDate = eventDate
            self.Calendar.reloadData()
            self.tableCalendar.alpha = 1
            self.Calendar.alpha = 1
            self.activityIndicator.alpha = 0
        })
        
        
    }
    
    
    
}
