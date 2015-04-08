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
    
    override func viewDidLoad() {
        println(PFUser.currentUser())
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(Storyboard.PhotoCellId) as UITableViewCell
        
        cell.textLabel?.text = "Satindar"
        
        return cell
    }
}
