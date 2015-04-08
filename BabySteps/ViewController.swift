//
//  ViewController.swift
//  BabySteps
//
//  Created by SATINDAR S DHILLON on 4/7/15.
//  Copyright (c) 2015 Satindar Dhillon. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
    
//    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
//    
//    @IBOutlet weak var pickedImage: UIImageView!
//    
//    @IBAction func pickImage(sender: UIButton) {
//        var imageController = UIImagePickerController()
//        imageController.delegate = self
//        imageController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//        imageController.allowsEditing = false
//        
//        self.presentViewController(imageController, animated: true, completion: nil)
//    }
//    
//    
//    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
//        println("Image selected")
//        self.dismissViewControllerAnimated(true, completion: nil)
//        
//        pickedImage.image = image
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
////        let score = PFObject(className: "Score")
////        score.setObject("Satindar", forKey: "name")
////        score.setObject(100, forKey: "number")
////        score.saveInBackgroundWithBlock {
////            (success: Bool, error: NSError!) -> Void in
////            if success == true {
////                println("Score created with ID \(score.objectId)")
////            } else {
////                println(error)
////            }
//        
////        var query = PFQuery(className: "Score")
////        query.getObjectInBackgroundWithId("ppNCCzgprd") {
////            (score: PFObject!, error: NSError!) -> Void in
////                if error == nil {
//////                    println(score.objectForKey("name") as NSString)
////                    score["name"] = "Satindararama"
////                    score["number"] = 1000
////                    
////                    score.save()
////                } else {
////                    println(error)
////                }
////        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


//}

