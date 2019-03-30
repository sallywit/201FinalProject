//
//  ActivitiesViewController.swift
//  FinalProject201
//
//  Created by Student on 3/29/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit



class ActivitiesViewController: UIViewController {
    
    var data : TripPreferences?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nightlifeValueChanged(_ sender: UISwitch) {
        data?.nightlife = sender.isOn
    }
    
    @IBAction func museumsValueChanged(_ sender: UISwitch) {
        data?.museums = sender.isOn
    }
    
    @IBAction func outdoorsValueChanged(_ sender: UISwitch) {
        data?.outdoors = sender.isOn
    }
    
    @IBAction func sightseeingValueChanged(_ sender: UISwitch) {
        data?.sightseeing = sender.isOn
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let date = segue.destination as? DateViewController{
            
            date.data = data
            
        }
        
    }

}
