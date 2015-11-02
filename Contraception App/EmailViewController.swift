//
//  EmailViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 6/30/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit
import Parse
import Bolts

class EmailViewController: UIViewController {
    
    //@IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    var toEmail = ""
    var toName = ""
    var messageText = ""
    var from = ""
    var fromName = ""
    var message: NSMutableArray = []
    var commaSeparted = ""
    
    
    var params = [String: String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "Top Bar"))
        
        var titleView : UIImageView
        // set the dimensions you want here
        titleView = UIImageView(frame:CGRectMake(0, 0, 320, 44))
        // Set how do you want to maintain the aspect
        titleView.contentMode = .ScaleAspectFit
        titleView.image = UIImage(named: "Top Bar")
        
        self.navigationItem.titleView = titleView

        
        commaSeparted = message.componentsJoinedByString(", ")
        
        let larcAlertController = UIAlertController(title: NSLocalizedString("After using this application are you more likely to use an IUD or an Implant?", comment: ""), message: NSLocalizedString("Your response will not be associated with any identifying information", comment: ""), preferredStyle: .Alert)
        
        // Create the actions
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("No", comment: ""), style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("No Pressed")
            
            if PFUser.currentUser() !== nil {
                let query1 = PFQuery(className:"data")
                query1.whereKey("userNumber", equalTo: PFUser.currentUser()!)
                query1.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]?, error: NSError?) -> Void in
                    
                    if error == nil {
                        // The find succeeded.
                        print("Successfully retrieved \(objects!.count) scores.")
                        // Do something with the found objects
                        if let objects = objects as? [PFObject] {
                            for object in objects {
                                //finalObject = object
                                print(object.objectId)
                                
                                let query2 = PFQuery(className:"data")
                                query2.getObjectInBackgroundWithId(object.objectId!) {
                                    (object, error) -> Void in
                                    if error != nil {
                                        print(error)
                                    } else {
                                        if let object = object {
                                            object["After_using_this_application_are_you_more_likely_to_use_an_IUD_or_an_Implant"] = "No"
                                        }
                                        object!.saveInBackground()
                                    }
                                }
                            }
                        }
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error!.userInfo)")
                    }
                }
                
            }

            
        }
        
        let yesAction = UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("Yes Pressed")
            
            if PFUser.currentUser() !== nil {
                let query1 = PFQuery(className:"data")
                query1.whereKey("userNumber", equalTo: PFUser.currentUser()!)
                query1.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]?, error: NSError?) -> Void in
                    
                    if error == nil {
                        // The find succeeded.
                        print("Successfully retrieved \(objects!.count) scores.")
                        // Do something with the found objects
                        if let objects = objects as? [PFObject] {
                            for object in objects {
                                //finalObject = object
                                print(object.objectId)
                                
                                let query2 = PFQuery(className:"data")
                                query2.getObjectInBackgroundWithId(object.objectId!) {
                                    (object, error) -> Void in
                                    if error != nil {
                                        print(error)
                                    } else {
                                        if let object = object {
                                            object["After_using_this_application_are_you_more_likely_to_use_an_IUD_or_an_Implant"] = "Yes"
                                        }
                                        object!.saveInBackground()
                                    }
                                }
                            }
                        }
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error!.userInfo)")
                    }
                }
                
            }
            
  
            
        }
        
        // Add the actions
        larcAlertController.addAction(yesAction)
        larcAlertController.addAction(cancelAction)
        
        // Present the controller
        self.presentViewController(larcAlertController, animated: true, completion: nil)
        

        

        
    }
    
    
    @IBAction func sendButtonPressed(sender: AnyObject) {
        
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")

        
//        params = ["toEmail": toEmail]
//        params = ["toName": toName]
//        params = ["text": messageText]
//
//
//        PFCloud.callFunctionInBackground("sendMail", withParameters: params) {
//            (response: AnyObject?, error: NSError?) -> Void in
//            let responseString = response as? String
//            println(responseString)
//            println(self.emailField.text)
//        
//        
//        }
        
        if (emailField.text!.isEmpty) {
            
            var alertController = UIAlertController(title: NSLocalizedString("Please enter your email address.", comment: ""), message: "", preferredStyle: .Alert)
            
            // Create the actions
            
            var cancelAction = UIAlertAction(title: NSLocalizedString("Okay", comment: ""), style: UIAlertActionStyle.Cancel) {
                UIAlertAction in
                NSLog("Cancel Pressed")
            }
            
            // Add the actions
            alertController.addAction(cancelAction)
            
            // Present the controller
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        else {
        
        
        //toName = self.nameField.text
        toEmail = self.emailField.text!
            messageText = String(format:"%@", NSLocalizedString("Your chosen forms of birth control are: ", comment: "") + commaSeparted + NSLocalizedString(". Ask your Healthcare Provider about these methods to learn more.\n\n\n\n\n\n\nDISCLAIMER: This application (app) does not provide specific medical advice and does not endorse any medical or professional service obtained through information provided on this app or any links provided. It is intended for general informational purposes only. Use of this app does not replace medical consultation with a qualified health or medical professional to meet the health and medical needs of you or others. Never ignore professional medical advice in seeking treatment because of something that you have read on this app. If you think you may have a medical emergency, please dial 911. While the content of this app is periodically updated, medical information changes rapidly and therefore, some information may be out of date, and/or contain inaccuracies or typographical errors.", comment: ""))
        print(messageText)
    
        
        
        
        PFCloud.callFunctionInBackground("sendMail", withParameters: ["text": messageText, "toEmail": toEmail, "name": toName]) {
            (response: AnyObject?, error: NSError?) -> Void in
            let responseString = response as? String
            print(responseString)
            
            if response !== nil {
//                var finalObject: AnyObject
//                finalObject = [AnyObject]()
                
                if PFUser.currentUser() !== nil {
                var query1 = PFQuery(className:"data")
                query1.whereKey("userNumber", equalTo: PFUser.currentUser()!)
                query1.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]?, error: NSError?) -> Void in
                    
                    if error == nil {
                        // The find succeeded.
                        print("Successfully retrieved \(objects!.count) scores.")
                        // Do something with the found objects
                        if let objects = objects as? [PFObject] {
                            for object in objects {
                                //finalObject = object
                                print(object.objectId)
                                
                                var query2 = PFQuery(className:"data")
                                query2.getObjectInBackgroundWithId(object.objectId!) {
                                    (object, error) -> Void in
                                    if error != nil {
                                        print(error)
                                    } else {
                                        if let object = object {
                                            let tempAge = object["age"] as! String
                                            if tempAge != "Not Provided" {
                                            object["results"] = self.commaSeparted
                                            }
                                        }
                                        object!.saveInBackground()
                                    }
                                }
                            }
                        }
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error!.userInfo)")
                    }
                }
            
                
                //self.alertCreated()
            }
                self.alertCreated()
            }
            
        }
        }
        }
            
            else {
                print("Internet connection FAILED")
                var alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
    
        
        

        
     func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
    func alertCreated() {
    let sentAlert: UIAlertView = UIAlertView()
    
    sentAlert.delegate = self
    sentAlert.tag = 1
    sentAlert.title = NSLocalizedString("Your results have been sent.", comment: "")
    sentAlert.message = NSLocalizedString("Thank you.", comment: "")
    sentAlert.addButtonWithTitle(NSLocalizedString("Okay", comment: ""))
    
    sentAlert.show()
    
}

func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
    
    
    switch buttonIndex {
        
    case 0:
        self.restart()
        NSLog("Sent")
        
        
    default:
        print("alertView \(buttonIndex) clicked")
    }
}

func restart() {
    
    PFUser.logOut()
    
    let mainController = self.storyboard!.instantiateViewControllerWithIdentifier("Main") as! ViewController
    
    self.navigationController!.pushViewController(mainController, animated: true)
    
}




}
