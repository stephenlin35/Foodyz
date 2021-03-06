//
//  RestaurantTableViewController.swift
//  Foodyz
//
//  Created by Stephen Lin on 1/28/17.
//  Copyright © 2017 Stephen Lin. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurants: [Restaurant] = [
        Restaurant(name: "SeaBlue Restaurant", location: "North Myrtle Beach, SC", type: "Contemporary American", image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Sushi Nakazawa", location: "New York, NY", type: "Sushi", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Fearrington House Restaurant", location: "Pittsboro, NC", type: "Contemporary American", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "n/naka", location: "Los Angeles, CA", type: "Japanese", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "St. Francis Winery & Vineyards", location: "Santa Rosa, CA", type: "Californian", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Ski Tip Lodge", location: "Keystone, CO", type: "American", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Twenty Eight Atlantic", location: "East Harwich, MA", type: "Seafood", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Kai - Sheraton", location: "Chandler, AZ", type: "Southwest", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "The French Room", location: "Dallas, TX", type: "Contemporary French", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Highlands Bar & Grill", location: "Birmingham, AL", type: "Contemporary Southern", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Ulu Ocean Grill", location: "Kaupulehu, HI", type: "Hawaiian", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "Abe Fisher", location: "Philadelphia, PA", type: "Global, International", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Acanto", location: "Chicago, IL", type: "Italian", image: "", isVisited: false),
        Restaurant(name: "All Purpose", location: "Milwaukee, WI", type: "Contemporary American", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Altius", location: "Pittsburgh, PA", type: "Contemporary American", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Antebellum", location: "Flowery Branch, GA", type: "Southern", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Ariana", location: "Bend, OR", type: "European", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Atera", location: "New York", type: "Contemporary American", image: "donostia.jpg", isVisited: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Remove title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }
    
//    func viewWllAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.hidesBarsOnSwipe = true
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        
        if restaurants[indexPath.row].isVisited {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) ->[UITableViewRowAction]? {
            // Social Sharing Button
            let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: { (action, indexPath) -> Void in
                let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
            }
            })
            
            
            // Delete button
            let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler:  { (action, indexPath) -> Void in
        
                // Delete the row from the data source
                self.restaurants.removeAtIndex(indexPath.row)
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            })
            
            // Customize UITableViewRowAction
            shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0,alpha: 1.0)
            deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
            
            return [deleteAction, shareAction]
    }
    
    // Segue to send restaurant image to the Detail View
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "showRestaurantDetail" {
                    if let indexPath = tableView.indexPathForSelectedRow {
                    let destinationController = segue.destinationViewController as! RestaurantDetailViewController
                    destinationController.restaurant = restaurants[indexPath.row]
                    }
            }
    }

}
