//
//  ResultsViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 6/4/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit
import Parse
import Bolts

class ResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var results:NSMutableArray = []
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var emailButton: UIButton!
    
    @IBOutlet weak var textButton: UIButton!
    
    var options:NSMutableArray = []
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        results = NSUserDefaults.standardUserDefaults().objectForKey("Final Results") as! NSMutableArray
        
        println(results)
        
        self.tableView.rowHeight = 70
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "Options Background"))
        
        //textView.text = String(format:"%@", results)
        
//        if results.containsObject("IUD") {
//            options.addObject("Intrauterine Device")
//        }
        
//        var gameScore = PFObject(className:"LARCResponce")
//        gameScore["yesAnswers"] = 0
//        gameScore["Question"] = "After using this application are you more likely to use an IUD or an Implant?"
//        gameScore.saveInBackgroundWithBlock {
//            (success: Bool, error: NSError?) -> Void in
//            if (success) {
//                // The object has been saved.
//            } else {
//                // There was a problem, check error.description
//            }
//        }
        
        options = ["Intrauterine Device", "Implant", "Birth Control Shot", "Vaginal Ring", "Patch", "Pill", "Mini-Pill", "Condom – Male and Female", "Spermicide", "Sponge with Spermicide"]

        if (results.count == 0) {
            
            var emptyAlertController = UIAlertController(title: NSLocalizedString("There were no birth control options that matched your preferences. Please reconsider some of your preferences regarding birth control.", comment: ""), message: NSLocalizedString("Press OK to change some of your preferences or press Cancel to exit the app.", comment: ""), preferredStyle: .Alert)
            
            // Create the actions
            
            var cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("No Pressed")
                self.restart()
            }
            
            var yesAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("Yes Pressed")
                
                let mainController = self.storyboard!.instantiateViewControllerWithIdentifier("YesController") as! QuestionViewController
                
                self.navigationController!.pushViewController(mainController, animated: true)
                
            }
            
            // Add the actions
            emptyAlertController.addAction(yesAction)
            emptyAlertController.addAction(cancelAction)
            
            // Present the controller
            self.presentViewController(emptyAlertController, animated: true, completion: nil)
            
        }
        

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
        
        //return options.count
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor.clearColor()
        }
            
        else {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
            cell.detailTextLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
            
        }
        
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.detailTextLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont.systemFontOfSize(20)
        
        // Feeds dictionary.
        var dict : NSDictionary! = results.objectAtIndex(indexPath.row) as? NSDictionary
        
        // Set cell properties.
        let row = indexPath.row
        cell.textLabel?.text = results[row] as? String
        
        
        
        
        return cell
    }
    
    func sortList() {
        if results.containsObject("Intrauterine Device") {
            results.removeObject("Intrauterine Device")
            options.addObject("Intrauterine Device")
            sortList()
            
        }
        
        else if results.containsObject("Implant") {
            results.removeObject("Implant")
            options.addObject("Implant")
            sortList()
            
            
        }
        
    }
    
    @IBAction func emailButtonPressed(sender: AnyObject) {
        
            
}
    
    @IBAction func noButtonPressed(sender: AnyObject) {
        
        var larcAlertController = UIAlertController(title: NSLocalizedString("After using this application are you more likely to use an IUD or an Implant?", comment: ""), message: NSLocalizedString("Your response will not be associated with any identifying information", comment: ""), preferredStyle: .Alert)
        
        // Create the actions
        
        var cancelAction = UIAlertAction(title: NSLocalizedString("No", comment: ""), style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("No Pressed")
            
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
                                            object["After_using_this_application_are_you_more_likely_to_use_an_IUD_or_an_Implant"] = "No"
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
            

            
            
            var quitAlert: UIAlertView = UIAlertView()
            
            quitAlert.delegate = self
            
            quitAlert.title = NSLocalizedString("If you're finished viewing your results, and you don't wish to receive them by email tap Okay to exit this page.", comment: "Results Exit")
            quitAlert.message = NSLocalizedString("Your email address will not be saved and the methods selected for you will not be connected to any identifying information.", comment: "Results Exit")
            quitAlert.addButtonWithTitle(NSLocalizedString("Cancel", comment: "Results Exit"))
            quitAlert.addButtonWithTitle(NSLocalizedString("Okay", comment: "Results Exit"))
            
            quitAlert.show()
        }
        
        var yesAction = UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("Yes Pressed")
            
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
                                            object["After_using_this_application_are_you_more_likely_to_use_an_IUD_or_an_Implant"] = "Yes"
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

            
            var quitAlert: UIAlertView = UIAlertView()
            
            quitAlert.delegate = self
            
            quitAlert.title = NSLocalizedString("If you're finished viewing your results, and you don't wish to receive them by email tap Okay to exit this page.", comment: "Results Exit")
            quitAlert.message = NSLocalizedString("Your email address will not be saved and the methods selected for you will not be connected to any identifying information.", comment: "Results Exit")
            quitAlert.addButtonWithTitle(NSLocalizedString("Cancel", comment: "Results Exit"))
            quitAlert.addButtonWithTitle(NSLocalizedString("Okay", comment: "Results Exit"))
            
            quitAlert.show()
            
            
        }
        
        // Add the actions
        larcAlertController.addAction(yesAction)
        larcAlertController.addAction(cancelAction)
        
        // Present the controller
        self.presentViewController(larcAlertController, animated: true, completion: nil)
        

    }
    
    func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        
        switch buttonIndex {
            
        case 1:
            self.restart()
            NSLog("sent")
            
        default:
            println("alertView \(buttonIndex) clicked")
            
            
        }
        
        
    }
    
    func restart() {
    
    let mainController = self.storyboard!.instantiateViewControllerWithIdentifier("Main") as! ViewController
    
    self.navigationController!.pushViewController(mainController, animated: true)
        
    }
    
        
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        
        if segue.identifier == "openResults" {
            
            if let destination = segue.destinationViewController as? FeedPageViewController {
                if let index = tableView.indexPathForSelectedRow()?.row {
                    destination.selectedFeedTitle = results[index] as! String
                    
                    //self.navigationController!.pushViewController(destination, animated: true)
                    
                }
            }
            
        }
        
        if segue.identifier == "sendResults" {
            
            if let destination = segue.destinationViewController as? EmailViewController {
                
                destination.message = results
            }
        }
    }
    

}
    


