//
//  DestinationViewController.swift
//  FinalProject201
//
//  Created by Student on 3/28/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import CoreLocation

class DestinationViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var findDestinationButton: UIButton!
    
    @IBOutlet weak var latitudeTextField: UITextField!
    
    @IBOutlet weak var longitudeTextField: UITextField!
    
    var data: TripPreferences = TripPreferences()
    var defaultLat = 0.0; var defaultLong = 0.0;
    
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            
            currentLocation = locationManager.location
            
        }
        
        if currentLocation != nil {
            defaultLat = currentLocation.coordinate.latitude
            defaultLong = currentLocation.coordinate.latitude
        }
        

    }
    
    @IBAction func didSingleTap(_ sender: UITapGestureRecognizer) {
        
        if (longitudeTextField.isFirstResponder){
            longitudeTextField.resignFirstResponder()
        } else if (latitudeTextField.isFirstResponder){
            latitudeTextField.resignFirstResponder()
        }
        
    }
    
    
    //Insert Google Maps here
    @IBAction func findDestinationWasClicked(_ sender: UIButton) {
        
        latitudeTextField.text = "188.24"
        longitudeTextField.text = "93.777"
        
    }
    
    @IBAction func latEditingDidEnd(_ sender: UITextField) {
        
        if let latitude = latitudeTextField.text {
            data.destinationLat = Double(latitude) ?? defaultLat
        }
        
    }
    
    @IBAction func longEditingDidEnd(_ sender: UITextField) {
        
        if let longitude = longitudeTextField.text {
            data.destinationLong = Double(longitude) ?? defaultLong
        }
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if (data.destinationLong == nil || data.destinationLat == nil){
            return false
        }
        
        return true
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let budget = segue.destination as?  BudgetViewController{
            
            //print(data.destinationLong!)
            //print(data.destinationLat!)
            
            budget.data = data
            
        }

    }


}
