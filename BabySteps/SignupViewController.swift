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
    private struct Storyboard {
        static let UserTableSegueID = "Jump to User Table"
        static let BabyListTableSegueID = "List of Babies I Know"
    }
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var babyName: UITextField!
    
    @IBAction func signup(sender: UIButton) {
        var error = validateForm()
        
        if error == "" {
            var user = PFUser()
            user.username = username.text
            user.password = password.text
            user["baby"] = babyName.text
            
            displaySpinner()
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool!, signupError: NSError!) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if signupError == nil {
                    if self.babyName.text != "" {
                        var baby = PFObject(className: "Baby")
                        baby["name"] = self.babyName.text
                        baby["parent"] = user
                        baby.save()
                        // direct to tableView where parent can allow people to follow baby
                        self.performSegueWithIdentifier(Storyboard.UserTableSegueID, sender: self)
                    } else {
                        self.performSegueWithIdentifier(Storyboard.BabyListTableSegueID, sender: self)
                    }
                    
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
    
    @IBAction func login(sender: UIButton) {
        var error = validateForm()
        
        if error == "" {
            displaySpinner()
            
            PFUser.logInWithUsernameInBackground(username.text, password: password.text) {
                (user: PFUser!, loginError: NSError!) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if user != nil {
                    self.performSegueWithIdentifier(Storyboard.UserTableSegueID, sender: self)
                } else {
                    if let errorString = loginError.userInfo?["error"] as? NSString {
                        error = errorString
                    } else {
                        error = "Something is messed up here"
                    }
                    self.displayAlert("Could not login", error: error)
                }
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() != nil {
            self.performSegueWithIdentifier(Storyboard.UserTableSegueID, sender: self)
        }
    }
    
    private func displayAlert(title: String, error: String) {
        var alertController = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    private func displaySpinner() {
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
    
    private func validateForm() -> String {
        var error = ""
        if username.text == "" || password.text == "" {
            error = "Please enter a username and password"
            displayAlert("Error in form", error: error)
        }
        return error
    }
}
