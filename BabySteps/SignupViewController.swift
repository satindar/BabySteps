//
//  SignupViewController.swift
//  BabySteps
//
//  Created by SATINDAR S DHILLON on 4/7/15.
//  Copyright (c) 2015 Satindar Dhillon. All rights reserved.
//

import UIKit
import Parse

class SignupViewController: UIViewController {
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signup(sender: UIButton) {
        var error = ""
        if username.text == "" || password.text == "" {
            error = "Please enter a usename and password"
        }
        
        if error != "" {
            displayAlert("Error in form", error: error)
        } else {
            var user = PFUser()
            user.username = username.text
            user.password = password.text
            
            displaySpinner()
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool!, signupError: NSError!) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if signupError == nil {
                    // Hooray! Let them use the app now.
                } else {
                    if let errorString = signupError.userInfo?["error"] as? NSString {
                        error = errorString
                    } else {
                        error = "Something is messed up here"
                    }
                    self.displayAlert("Could not signup", error: error)
                }
            }
        }
    }
    
    func displayAlert(title: String, error: String) {
        var alertController = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func displaySpinner() {
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
}
