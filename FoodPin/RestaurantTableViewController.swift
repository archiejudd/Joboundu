//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 14/8/15.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    var restaurants:[Restaurant] = [
        
        Restaurant(name: "Aidan", jobType: "Actor", type: "4.5 Stars", location: "West Brompton", jobDescription: "act in your commercial", image: "aidanLindsay", isVisited: false),
        
        Restaurant(name: "Aisha", jobType: "Singer", type: "5.0 Stars", location: "Holland Park", jobDescription: "sing in your band in any of the following genres: Blues, Soul, Funk or Jazz", image: "aishaBennett", isVisited: false),
        
        Restaurant(name: "Alex", jobType: "Legal Writing", type: "4.8 Stars", location: "Croydon", jobDescription: "write any legal documents for you", image: "alexStock", isVisited: false),
        
        Restaurant(name: "Amelia", jobType: "Press Releases", type: "4.9 Stars", location: "Brixton", jobDescription: "write you a press release", image: "ameliaBall", isVisited: false),
        
        Restaurant(name: "Archie", jobType: "Maths Tutor", type: "3.8 Stars", location: "Battersea", jobDescription: "teach GSCE or A-level Maths", image: "archieJudd", isVisited: false),
        
        Restaurant(name: "Billy", jobType: "Choreography", type: "3.0 Stars", location: "Chelsea", jobDescription: "choreograph your dream play", image: "billyHamshaw", isVisited: false),
        
        Restaurant(name: "Guy, Pantom", jobType: "Actor", type: "4.1 Stars", location: "Kensington", jobDescription: "act in your TV Series", image: "guyDixon", isVisited: false),
        
        Restaurant(name: "Hector", jobType: "Dressmaker", type: "3.9 Stars", location: "Oxford Circus", jobDescription: "make you a beautiful bespoke wedding dress", image: "hectorJudd", isVisited: false),
        
        Restaurant(name: "Luke", jobType: "Glassmaker", type: "4.9 Stars", location: "Acton", jobDescription: "make you a bespoke piece of glass", image: "lukeVenn", isVisited: false),
        
        Restaurant(name: "Robert", jobType: "Furniture Design", type: "4.2 Stars", location: "Canary Wharf", jobDescription: "design furniture for commercial or domestic use", image: "robertDon", isVisited: false),
        
        Restaurant(name: "Stuart", jobType: "Fashion Photography", type: "5.0 Stars", location: "Clapham Junction", jobDescription: "take photos at your cat-walk", image: "stuartSwift", isVisited: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        // Enable self sizing cells
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurants[indexPath.row].name + ", " + restaurants[indexPath.row].jobType
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .Checkmark : .None
        
        return cell
    }
    
    // MARK: - Table view delegate
 
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            // Delete the row from the data source
            restaurants.removeAtIndex(indexPath.row)
        }
        
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        // Social Sharing Button
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: { (action, indexPath) -> Void in
            
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
            }
        })
        
        // Delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete",handler: { (action, indexPath) -> Void in
            
            // Delete the row from the data source
            self.restaurants.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        
        // Set the button color
        shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)

        return [deleteAction, shareAction]
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! RestaurantDetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }
    
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {
    
    }

}
