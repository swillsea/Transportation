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
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        mapView.showsPointsOfInterest = true
        
        let parentVC = self.parentViewController as! CustomTabBarController
        print("\(parentVC.busStops[0])")

        for stop in parentVC.busStops {
            let annotation = MKPointAnnotation()
            let long = Double(stop["longitude"] as! String)!
            let lat = Double(stop["latitude"] as! String)!
            annotation.coordinate = CLLocationCoordinate2DMake(lat , long)
            annotation.title = stop["cta_stop_name"] as? String
            annotation.subtitle = stop["routes"] as? String
            self.mapView.addAnnotation(annotation)
        }
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isEqual(mapView.userLocation) {
            return nil
        } else {
            let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            pin.canShowCallout = true
//            pin.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
            pin.leftCalloutAccessoryView = UIImageView.init(image: UIImage(named: "bus"))
            pin.pinTintColor = UIColor.blueColor()
            return pin
        }
    }
 
}
