//
//  ViewController.swift
//  Landmarks
//
//  Created by Valerie Greer on 3/7/17.
//  Copyright © 2017 Shane Empie. All rights reserved.
//

import UIKit
import MapKit
import Parse

class ViewController: UIViewController {
    
    @IBOutlet var landmarksMap :MKMapView!
    
    var landmarksArray = [Landmark]()
    
    //MARK: - Interactivity Methods
    
    @IBAction func fetchLandmarksPressed(button: UIBarButtonItem) {
        fetchLandmarks()
    }
    
    //MARK: - Map View Methods
    
    func annotateMapLocations() {
        var pinsToRemove = [MKPointAnnotation]()
        for annotation in landmarksMap.annotations {
            if annotation is MKPointAnnotation {
                pinsToRemove.append(annotation as! MKPointAnnotation)
            }
        }
        landmarksMap.removeAnnotations(pinsToRemove)
        
        for landmark in self.landmarksArray {
            let landmarkAnnotation = MKPointAnnotation()
            print("\(landmark)")
            print("\(landmark.latitude), \(landmark.latitude)")
            landmarkAnnotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(landmark.latitude), longitude: CLLocationDegrees(landmark.longitude))
            landmarkAnnotation.title = landmark.name
            landmarkAnnotation.subtitle = "\(landmark.streetAddress), \(landmark.city), \(landmark.state) \(landmark.zip)"
            landmarksMap.addAnnotation(landmarkAnnotation)
        }
    }
    
    //MARK: - Parse Methods
    
    func fetchLandmarks() {
        let query = PFQuery(className: "Landmark")
        query.limit = 10
        query.findObjectsInBackground { (results, error) in
            if let err = error {
                print("Got error \(err.localizedDescription)")
            } else {
                self.landmarksArray = results as! [Landmark]
                print("Count: \(self.landmarksArray.count)")
                self.annotateMapLocations()
                self.landmarksMap.showAnnotations(self.landmarksMap.annotations, animated: true)
            }
        }
    }
    
    //MARK: - Life Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

