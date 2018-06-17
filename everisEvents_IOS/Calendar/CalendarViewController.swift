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
    
    @IBOutlet weak var tableCalendar: UITableView!
    @IBOutlet weak var Calendar: FSCalendar!
    
    var calendarBusiness = CalendarBusiness ()
    var eventDate = [String]()
    var calendarEvents = [CellBaseProtocol] ()
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateString = self.dateFormatter.string(from: date)
        
        if self.eventDate.contains(dateString) {
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateString = self.dateFormatter.string(from: date)
        
        if self.eventDate.contains(dateString) {
            return 1
        }
        return 0
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventDate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = calendarEvents[indexPath.row].buildCell(indexPath: indexPath, tableview: tableCalendar)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableCalendar.delegate = self
        tableCalendar.dataSource = self
        Calendar.delegate = self
        Calendar.dataSource = self
        tableCalendar.register(UINib(nibName: "EventCalendar", bundle: nil), forCellReuseIdentifier: "EventCalendar")
        
        calendarBusiness.getEventDate(completion: {(eventDate : [String])-> Void in
            self.eventDate = eventDate
            self.Calendar.reloadData()
        })
        
        calendarBusiness.getCalendarEvents(completion: {(calendarEvents : [CellBaseProtocol])-> Void in
            self.calendarEvents = calendarEvents
            self.tableCalendar.reloadData()
        })
        
    }



}
