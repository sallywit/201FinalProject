//
//  DateViewController.swift
//  FinalProject201
//
//  Created by Student on 3/29/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    
    var data : TripPreferences?
    
    @IBOutlet weak var beginDatePicker: UIDatePicker!
    
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set min date to today
        beginDatePicker.minimumDate = Date()
        endDatePicker.minimumDate = Date()
        
        //intialize end to a week from tomorrow
        endDatePicker.date = Calendar.current.date(byAdding: .day, value: 8, to: Date()) ?? Date()
        
        //initialize start to tomorrow
        beginDatePicker.date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()

    }
    
    @IBAction func startValueChanged(_ sender: UIDatePicker) {
        
        let date = sender.date
        let format = DateFormatter()
        format.dateFormat = "MM-dd-yyyy"
        
        data?.dateBegin = format.string(from: date)
        
    }
    
    @IBAction func endValueChanged(_ sender: UIDatePicker) {
        
        let date = sender.date
        let format = DateFormatter()
        format.dateFormat = "MM-dd-yyyy"
        
        data?.dateEnd = format.string(from: date)
        
        
    }
    
    //insert error message if end < begin
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if (beginDatePicker.date > endDatePicker.date){
            return false
        }
        
        return true
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let friends = segue.destination as? InviteFriendsTableViewController{
            
            friends.data = data
            
        }
        
    }

}
