//
//  ViewController.swift
//  BabySteps
//
//  Created by SATINDAR S DHILLON on 4/7/15.
//  Copyright (c) 2015 Satindar Dhillon. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let score = PFObject(className: "Score")
        score.setObject("Satindar", forKey: "name")
        score.setObject(100, forKey: "number")
        score.saveInBackgroundWithBlock {
            (success: Bool, error: NSError!) -> Void in
            if success == true {
                println("Score created with ID \(score.objectId)")
            } else {
                println(error)
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

