//
//  Landmark.swift
//  Landmarks
//
//  Created by Valerie Greer on 3/7/17.
//  Copyright © 2017 Shane Empie. All rights reserved.
//

import UIKit
import MapKit

class Landmark: NSObject {

    var name                :String?
    var streetAddress       :String?
    var city                :String?
    var state               :String?
    var zip                 :String?
    var latitude            :String?
    var longitude           :String?
    var landmarkDescription :String?
    
    convenience init(name: String, streetAddress: String, city: String, state: String, zip: String, latitude: String, longitude: String, landmarkDescription: String) {
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
    
}
