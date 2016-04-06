//
//  CustomTabBarController.swift
//  BusRoutes
//
//  Created by Sam on 4/5/16.
//  Copyright © 2016 Sam Willsea. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    var busStops = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://s3.amazonaws.com/mmios8week/bus.json")
       
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            do {
                self.busStops = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)["row"] as! [NSDictionary]
                
                dispatch_async(dispatch_get_main_queue(), {
//                    self.sendToListView()
                })
                
            } catch let error as NSError {
                print("json error: \(error.localizedDescription)")
            }
        }
        task.resume()
        
    }
    
//    override func setValuesForKeysWithDictionary(keyedValues: [String : AnyObject]) {
//    }
    
    
//    
//    func sendToMapView() {
//        let destVC = self.viewControllers![0] as? MapViewController
//        destVC!.busStops = self.busStops
//    }
//    
//    func sendToListView() {
//        let destVC = self.viewControllers![1] as? ListViewController
//        destVC!.tableView?.reloadData()
//    }
    
    
    
    
}
