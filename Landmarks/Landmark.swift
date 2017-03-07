//
//  Landmark.swift
//  Landmarks
//
//  Created by Valerie Greer on 3/7/17.
//  Copyright © 2017 Shane Empie. All rights reserved.
//

import UIKit
import Parse

class Landmark: PFObject, PFSubclassing {

    @NSManaged var name                :String
    @NSManaged var streetAddress       :String
    @NSManaged var city                :String
    @NSManaged var state               :String
    @NSManaged var zip                 :String
    @NSManaged var latitude            :NSNumber
    @NSManaged var longitude           :NSNumber
    @NSManaged var landmarkDescription :String
    
    convenience init(name: String, streetAddress: String, city: String, state: String, zip: String, latitude: NSNumber, longitude: NSNumber, landmarkDescription: String) {
        self.init()
        self.name = name
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zip = zip
        self.latitude = latitude
        self.longitude = longitude
        self.landmarkDescription = landmarkDescription
    }
    
    static func parseClassName() -> String {
        return "Landmark"
    }
    
}
