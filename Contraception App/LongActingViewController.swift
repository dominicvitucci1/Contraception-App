//
//  LongActingViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 6/2/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit
import Parse
import Bolts

class LongActingViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var yesButton: UIButton!
    
    @IBOutlet weak var noButton: UIButton!
    
    var labelText = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
//        navigationItem.leftBarButtonItem = backButton
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "Top Bar"))
        
        var titleView : UIImageView
        // set the dimensions you want here
        titleView = UIImageView(frame:CGRectMake(0, 0, 320, 44))
        // Set how do you want to maintain the aspect
        titleView.contentMode = .ScaleAspectFit
        titleView.image = UIImage(named: "Top Bar")
        
        self.navigationItem.titleView = titleView

        
        labelText = NSLocalizedString("Do you know there are long acting reversible contraceptives?", comment: "Know LARC")
        
        questionLabel.text = "\(labelText)"
        
        if PFUser.currentUser() == nil {
            
        
        PFAnonymousUtils.logInWithBlock {
            (user: PFUser?, error: NSError?) -> Void in
            if error != nil || user == nil {
                println("Anonymous login failed.")
            } else {
                println("Anonymous user logged in.")
                
                var data = PFObject(className:"data")
                data["userNumber"] = PFUser.currentUser()
                data["age"] = "Not Provided"
                data["ethnicity"] = "Not Provided"
                data["race"] = "Not Provided"
                data["medicalAssistance"] = "Not Provided"
                data.saveInBackgroundWithBlock {
                    (success: Bool, error: NSError?) -> Void in
                    if (success) {
                        println("objectSaved")
                    }
                }
            }
        }
    }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yesQuestionOne(sender: AnyObject) {
       
        if let text = questionLabel.text {
            
            switch text {
                case NSLocalizedString("Do you know there are long acting reversible contraceptives?", comment: "Know LARC Case"):
                    
                    if PFUser.currentUser() !== nil {
                        var query1 = PFQuery(className:"data")
                        query1.whereKey("userNumber", equalTo: PFUser.currentUser()!)
                        query1.findObjectsInBackgroundWithBlock {
                            (objects: [AnyObject]?, error: NSError?) -> Void in
                            
                            if error == nil {
                                // The find succeeded.
                                println("Successfully retrieved \(objects!.count) scores.")
                                // Do something with the found objects
                                if let objects = objects as? [PFObject] {
                                    for object in objects {
                                        //finalObject = object
                                        println(object.objectId)
                                        
                                        var query2 = PFQuery(className:"data")
                                        query2.getObjectInBackgroundWithId(object.objectId!) {
                                            (object, error) -> Void in
                                            if error != nil {
                                                println(error)
                                            } else {
                                                if let object = object {
                                                    object["Do_you_know_there_are_long_acting_reversible_contraceptives"] = "Yes"
                                                }
                                                object!.saveInBackground()
                                            }
                                        }
                                    }
                                }
                            } else {
                                // Log details of the failure
                                println("Error: \(error!) \(error!.userInfo!)")
                            }
                        }

                    }
                    
                    
                    questionLabel.text = NSLocalizedString("Do you want to know more about them?", comment: "Know More LARC")

                
                case NSLocalizedString("Do you want to know more about them?", comment: "Know More Case LARC"):
                    
                    if PFUser.currentUser() !== nil {
                        var query1 = PFQuery(className:"data")
                        query1.whereKey("userNumber", equalTo: PFUser.currentUser()!)
                        query1.findObjectsInBackgroundWithBlock {
                            (objects: [AnyObject]?, error: NSError?) -> Void in
                            
                            if error == nil {
                                // The find succeeded.
                                println("Successfully retrieved \(objects!.count) scores.")
                                // Do something with the found objects
                                if let objects = objects as? [PFObject] {
                                    for object in objects {
                                        //finalObject = object
                                        println(object.objectId)
                                        
                                        var query2 = PFQuery(className:"data")
                                        query2.getObjectInBackgroundWithId(object.objectId!) {
                                            (object, error) -> Void in
                                            if error != nil {
                                                println(error)
                                            } else {
                                                if let object = object {
                                                    object["Do_you_want_to_know_more_about_them"] = "Yes"
                                                }
                                                object!.saveInBackground()
                                            }
                                        }
                                    }
                                }
                            } else {
                                // Log details of the failure
                                println("Error: \(error!) \(error!.userInfo!)")
                            }
                        }
                        
                    }

                    
                    let feedController = self.storyboard!.instantiateViewControllerWithIdentifier("FeedController") as! FeedPageViewController

                    feedController.selectedFeedTitle = NSLocalizedString("Long-Acting Reversible Contraceptives (LARC)", comment: "LARC Label")
                    feedController.selectedFeedFeedContent = NSLocalizedString("Long-acting reversible contraceptives (LARC) or long-acting reversible birth control are methods of birth control that provide prevent pregnancy for a long period of time - up to 10 years for some methods! LARC include implants and intrauterine devices (IUD). What are the advantages of using LARCs? The advantages of using LARCs is that they are safe, reliable. and reversible. Using LARCs is better at preventing pregnancy because you would use the birth control method consistently and correctly without having to think about it. It does not require taking a pill every day or doing something every time before having sex. Most important, almost all women can use implants and IUDs even teenagers.", comment: "LARC Description")
 
                

                self.navigationController!.pushViewController(feedController, animated: true)
                
                
            default:
                questionLabel.text = "error"
                
            }
            
        }
        
        
    }
    
    @IBAction func noQuestionOne(sender: AnyObject) {
        
        if let text = questionLabel.text {
            
            switch text {
            case NSLocalizedString("Do you know there are long acting reversible contraceptives?", comment: "Know Case LARC"):
                
                if PFUser.currentUser() !== nil {
                    var query1 = PFQuery(className:"data")
                    query1.whereKey("userNumber", equalTo: PFUser.currentUser()!)
                    query1.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]?, error: NSError?) -> Void in
                        
                        if error == nil {
                            // The find succeeded.
                            println("Successfully retrieved \(objects!.count) scores.")
                            // Do something with the found objects
                            if let objects = objects as? [PFObject] {
                                for object in objects {
                                    //finalObject = object
                                    println(object.objectId)
                                    
                                    var query2 = PFQuery(className:"data")
                                    query2.getObjectInBackgroundWithId(object.objectId!) {
                                        (object, error) -> Void in
                                        if error != nil {
                                            println(error)
                                        } else {
                                            if let object = object {
                                                object["Do_you_know_there_are_long_acting_reversible_contraceptives"] = "No"
                                            }
                                            object!.saveInBackground()
                                        }
                                    }
                                }
                            }
                        } else {
                            // Log details of the failure
                            println("Error: \(error!) \(error!.userInfo!)")
                        }
                    }
                    
                }
                
                questionLabel.text = NSLocalizedString("Do you want to know more about them?", comment: "Know More LARC")
                
            case NSLocalizedString("Do you want to know more about them?", comment: "Know More Case"):
                
                if PFUser.currentUser() !== nil {
                    var query1 = PFQuery(className:"data")
                    query1.whereKey("userNumber", equalTo: PFUser.currentUser()!)
                    query1.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]?, error: NSError?) -> Void in
                        
                        if error == nil {
                            // The find succeeded.
                            println("Successfully retrieved \(objects!.count) scores.")
                            // Do something with the found objects
                            if let objects = objects as? [PFObject] {
                                for object in objects {
                                    //finalObject = object
                                    println(object.objectId)
                                    
                                    var query2 = PFQuery(className:"data")
                                    query2.getObjectInBackgroundWithId(object.objectId!) {
                                        (object, error) -> Void in
                                        if error != nil {
                                            println(error)
                                        } else {
                                            if let object = object {
                                                object["Do_you_want_to_know_more_about_them"] = "No"
                                            }
                                            object!.saveInBackground()
                                        }
                                    }
                                }
                            }
                        } else {
                            // Log details of the failure
                            println("Error: \(error!) \(error!.userInfo!)")
                        }
                    }
                    
                }
                
                
                let yesController = self.storyboard!.instantiateViewControllerWithIdentifier("YesController") as! QuestionViewController
                
                self.navigationController!.pushViewController(yesController, animated: true)
                
            default:
                questionLabel.text = "error"
        
        
            }
        }
}
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
