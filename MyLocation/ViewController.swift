//
//  ViewController.swift
//  MyLocation
//
//  Created by Developer Inspirus on 4/18/15.
//  Copyright (c) 2015 Duc Tran. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    var locationManager: CLLocationManager!
    var location: CLLocation! {
        didSet {
            latitudeLabel.text = "\(location.coordinate.latitude)"
            longitudeLabel.text = "\(location.coordinate.longitude)"
        }
    }
    
    @IBAction func updateLocation(sender: AnyObject) {
        locationManager.startUpdatingLocation()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        checkCoreLocationPermission()
    }
    
    func checkCoreLocationPermission()
    {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        } else if CLLocationManager.authorizationStatus() == .NotDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else if CLLocationManager.authorizationStatus() == .Restricted {
            // put an alert and explain things here
            println("unauthorized to use location service")
        }
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        location = (locations as! [CLLocation]).last
        locationManager.stopUpdatingLocation()      // save battery
    }

}

































