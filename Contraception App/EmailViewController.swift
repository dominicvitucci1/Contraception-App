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
        
        commaSeparted = message.componentsJoinedByString(", ")
        
        var larcAlertController = UIAlertController(title: "After using this application are you more likely to use an IUD or an Implant?", message: "Your responce will not be associated with any identifying information", preferredStyle: .Alert)
        
        // Create the actions
        
        var cancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("No Pressed")
            
        }
        
        var yesAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("Yes Pressed")
            
            var query = PFQuery(className:"LARCResponce")
            query.getObjectInBackgroundWithId("AOCYJDftn3") {
                (gameScore: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    println(error)
                }
                    
                else {
                    gameScore!.incrementKey("yesAnswers", byAmount: 1)
                    gameScore!.saveInBackgroundWithBlock {
                        (success: Bool, error: NSError?) -> Void in
                        if (success) {
                            // The score key has been incremented
                        } else {
                            // There was a problem, check error.description
                        }
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
        
        if (emailField.text.isEmpty) {
            
            var alertController = UIAlertController(title: "Please enter your email address.", message: "", preferredStyle: .Alert)
            
            // Create the actions
            
            var cancelAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Cancel) {
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
        toEmail = self.emailField.text
            messageText = String(format:"%@", "Your chosen forms of birth control are: " + commaSeparted + ". Ask your Healthcare Provider about these methods to learn more.\n\n\n\n\n\n\nDISCLAIMER: This application (app) does not provide specific medical advice and does not endorse any medical or professional service obtained through information provided on this app or any links provided. It is intended for general informational purposes only. Use of this app does not replace medical consultation with a qualified health or medical professional to meet the health and medical needs of you or others. Never ignore professional medical advice in seeking treatment because of something that you have read on this app. If you think you may have a medical emergency, please dial 911. While the content of this app is periodically updated, medical information changes rapidly and therefore, some information may be out of date, and/or contain inaccuracies or typographical errors.")
        println(messageText)
    
        
        
        
        PFCloud.callFunctionInBackground("sendMail", withParameters: ["text": messageText, "toEmail": toEmail, "name": toName]) {
            (response: AnyObject?, error: NSError?) -> Void in
            let responseString = response as? String
            println(responseString)
            
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
                                            object["results"] = self.commaSeparted
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
            
                
                //self.alertCreated()
            }
                self.alertCreated()
            }
            
        }
        }
    
        
        

        
     func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
    func alertCreated() {
    var sentAlert: UIAlertView = UIAlertView()
    
    sentAlert.delegate = self
    sentAlert.tag = 1
    sentAlert.title = "Your results have been sent."
    sentAlert.message = "Thank you."
    sentAlert.addButtonWithTitle("Okay")
    
    sentAlert.show()
    
}

func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
    
    
    switch buttonIndex {
        
    case 0:
        self.restart()
        NSLog("Sent")
        
        
    default:
        println("alertView \(buttonIndex) clicked")
    }
}

func restart() {
    
    PFUser.logOut()
    
    let mainController = self.storyboard!.instantiateViewControllerWithIdentifier("Main") as! ViewController
    
    self.navigationController!.pushViewController(mainController, animated: true)
    
}




}