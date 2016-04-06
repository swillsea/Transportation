//
//  ListViewController.swift
//  BusRoutes
//
//  Created by Sam on 4/5/16.
//  Copyright © 2016 Sam Willsea. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var parentVC = CustomTabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData()
        
        parentVC = self.parentViewController as! CustomTabBarController

        let dict = parentVC.busStops[0]
        print("\(dict)")

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parentVC.busStops.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        

        let stop = parentVC.busStops[indexPath.row]
        
        let long = stop["longitude"] as? String
        let lat = stop["latitude"] as? String
        cell.textLabel?.text = stop["stop_id"] as? String
        cell.detailTextLabel?.text = "\(lat!), \(long!)"
        
        return cell
    }
}
