//
//  RestaurantTableViewController.swift
//  Foodyz
//
//  Created by Stephen Lin on 1/28/17.
//  Copyright © 2017 Stephen Lin. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate"]
    
    var restaurantImages = ["cafedeadend.jpg", "cafeloisl.jpg", "forkeerestaurant.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "grahamavenuemeats.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg"]
    
    var restaurantLocations = ["New York", "Paris", "Florida", "New York", "Louisiana", "New York", "San Francisco", "London", "Hong Kong", "Las Vegas"]
    
    var restaurantTypes = ["Coffee/Bakery", "Italian", "Western", "Coffee/Bakery", "Seafood", "Asian", "French", "Bakery", "Dessert"]
    
    var restaurantIsVisited = [Bool](count: 10, repeatedValue: false)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

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
        return restaurantNames.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        if restaurantIsVisited[indexPath.row] {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) ->[UITableViewRowAction]? {
            // Social Sharing Button
            let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: { (action, indexPath) -> Void in
                let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
            }
            })
            
            
            // Delete button
            let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler:  { (action, indexPath) -> Void in
        
                // Delete the row from the data source
                self.restaurantNames.removeAtIndex(indexPath.row)
                self.restaurantLocations.removeAtIndex(indexPath.row)
                self.restaurantTypes.removeAtIndex(indexPath.row)
                self.restaurantIsVisited.removeAtIndex(indexPath.row)
                self.restaurantImages.removeAtIndex(indexPath.row)
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
                    destinationController.restaurantImage = restaurantImages[indexPath.row]
                    }
            }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            restaurantNames.removeAtIndex(indexPath.row)
            restaurantLocations.removeAtIndex(indexPath.row)
            restaurantTypes.removeAtIndex(indexPath.row)
            restaurantIsVisited.removeAtIndex(indexPath.row)
            restaurantImages.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        /*
        else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        } */
    }
    */
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        // Create an option menu as an action sheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
//        
//        // Add actions to the menu
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//        
//        let callActionHandler = { (action:UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//        }
//        
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: UIAlertActionStyle.Default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//        
//        let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default,
//                handler: {
//                    (action:UIAlertAction!) -> Void in
//                
//                    let cell = tableView.cellForRowAtIndexPath(indexPath)
//                    cell?.accessoryType = .Checkmark
//                    self.restaurantIsVisited[indexPath.row] = true
//                })
//        optionMenu.addAction(isVisitedAction)
//        
//        // Display the menu
//        self.presentViewController(optionMenu, animated: true, completion: nil)
//    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
