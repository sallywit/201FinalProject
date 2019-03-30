//
//  TripFinder.swift
//  FinalProject201
//
//  Created by Student on 3/29/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

struct TripPreferences {
    
    var destinationLat : Double?
    var destinationLong : Double?
    
    var hotelBudget : Double; var travelBudget: Double
    var activitiesBudget: Double; var foodBudget : Double
    
    var nightlife : Bool; var museums : Bool
    var sightseeing: Bool; var outdoors : Bool
    
    var dateBegin : String
    var dateEnd : String
    
    var friendsInvited : [Int]?
    
    init(){
        
        destinationLat = nil; destinationLong = nil
        
        hotelBudget = 0.0; travelBudget = 0.0
        activitiesBudget = 0.0; foodBudget = 0.0
        
        nightlife = false; museums = false
        sightseeing = false; outdoors = false
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "MM-dd-yyyy"
        
        dateBegin = format.string(from: date)
        dateEnd = format.string(from: date)
        
        friendsInvited = nil
        
    }
    
    /*func setDestination(lat: Double, long: Double){
        destinationLat = lat
        destinationLong = long
    }
    
    func setBudget(hotel: Double, travel: Double, activities: Double, food: Double){
        hotelBudget = hotel
        travelBudget = travel
        activitiesBudget = activities
        foodBudget = food
    }
    
    func setActivities(nightlife: Bool, museums: Bool, sightseeing: Bool, outdoors: Bool){
        
        self.nightlife = nightlife
        self.museums = museums
        self.sightseeing = sightseeing
        self.outdoors = outdoors
        
    }
    
    func setDates(begin: String, end: String){
        
        dateBegin = begin
        dateEnd = end
        
    }
    
    func addFriend (friendID: Int){
        
        if friendsInvited == nil {
            friendsInvited = [Int]()
        }
        
        friendsInvited?.append(friendID)
    }*/
    
    
    
}
