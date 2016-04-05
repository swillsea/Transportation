//
//  MapViewController.swift
//  BusRoutes
//
//  Created by Sam on 4/5/16.
//  Copyright © 2016 Sam Willsea. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let parentVC = self.parentViewController as! CustomTabBarController
        let dict = parentVC.busStops[0]
        print("\(dict)")
        
    }

 
}
