//
//  BudgetViewController.swift
//  FinalProject201
//
//  Created by Student on 3/29/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController {
    
    
    @IBOutlet weak var hotelTextField: UITextField!
    @IBOutlet weak var travelTextField: UITextField!
    @IBOutlet weak var activitiesTextField: UITextField!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var foodTextField: UITextField!
    
    var total = 0.0
    var hotel = 0.0
    var travel = 0.0
    var activities = 0.0
    var food = 0.0
    
    var data : TripPreferences?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefaultValues()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true);
        //setDefaultValues()
    }
    
    @IBAction func didSingleTap(_ sender: UITapGestureRecognizer) {
        
        if (hotelTextField.isFirstResponder){
            
            hotelTextField.resignFirstResponder()
            
        }else if (travelTextField.isFirstResponder){
            
            travelTextField.resignFirstResponder()
            
        } else if (activitiesTextField.isFirstResponder) {
            
            activitiesTextField.resignFirstResponder()
            
        } else if (foodTextField.isFirstResponder){
            
            foodTextField.resignFirstResponder()
            
        }
        
    }
    
    
    @IBAction func hotelEditingDidEnd(_ sender: UITextField) {
        
        if let h = hotelTextField.text {
            hotel = Double(h) ?? 0.0
        }
        
        updateTotal()
        
    }
    
    @IBAction func travelEditingDidEnd(_ sender: UITextField) {
        
        if let t = travelTextField.text {
            travel = Double(t) ?? 0.0
        }
        
        updateTotal()
        
    }
    
    
    @IBAction func activitiesEditingDidEnd(_ sender: UITextField) {
        
        if let a = activitiesTextField.text {
            activities = Double(a) ?? 0.0
        }
        
        updateTotal()
        
    }
    
    
    @IBAction func foodEditingDidEnd(_ sender: UITextField) {
        
        if let f = foodTextField.text {
            food = Double(f) ?? 0.0
        }
        
        updateTotal()
        
    }
    
    func updateTotal(){
        
        data?.hotelBudget = hotel
        data?.travelBudget = travel
        data?.activitiesBudget = activities
        data?.foodBudget = food
        
        total = hotel + travel + activities + food
        
        totalAmount.text = String(format: "$%.2f", total)
        
    }
    
    
    func setDefaultValues(){
        
        total = 0
        
        hotelTextField.text = ""
        hotelTextField.placeholder = "0.00"
        
        travelTextField.text = ""
        travelTextField.placeholder = "0.00"
        
        activitiesTextField.text = ""
        activitiesTextField.placeholder = "0.00"
        
        foodTextField.text = ""
        foodTextField.placeholder = "0.00"
        
        totalAmount.text = "$0.00"
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if (hotelTextField.text == "" || travelTextField.text == "" || activitiesTextField.text == "" || foodTextField.text == ""){
            
            return false
        }
        
        return true
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let Activities = segue.destination as? ActivitiesViewController{
            
            Activities.data = data
            
        }
        
    }
    

}
