//
//  UserTableViewController.swift
//  BabySteps
//
//  Created by SATINDAR S DHILLON on 4/7/15.
//  Copyright (c) 2015 Satindar Dhillon. All rights reserved.
//

import UIKit
import Parse

class UserTableViewController: UITableViewController {
    private struct Storyboard {
        static let PhotoCellId = "Photo Cell"
    }
    
    var users = [String]()
    
    override func viewDidLoad() {
        var query = PFUser.query()
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
            self.users.removeAll(keepCapacity: true)
            self.users = objects.map { ($0 as PFUser).username }.filter { $0 != PFUser.currentUser().username }
            println(PFUser.currentUser().username)
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(Storyboard.PhotoCellId) as UITableViewCell
        cell.textLabel?.text = users[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if cell.accessoryType == UITableViewCellAccessoryType.Checkmark {
            cell.accessoryType = UITableViewCellAccessoryType.None
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            //create relationship here
            var humanConnection = PFObject(className: "Connections")
            humanConnection["caretaker"] = cell.textLabel?.text
            humanConnection["parental"] = PFUser.currentUser()
            humanConnection.save()
        }
    }
}
