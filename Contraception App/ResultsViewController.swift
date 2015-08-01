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
            
            var emptyAlertController = UIAlertController(title: "There were no birth control options that matched your preferances. Please reconsider some of your preferances regarding birth control.", message: "Press OK to change some of your preferances or press Cancel to exit the app.", preferredStyle: .Alert)
            
            // Create the actions
            
            var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("No Pressed")
                self.restart()
            }
            
            var yesAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
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
        
        var larcAlertController = UIAlertController(title: "After using this application are you more likely to use an IUD or an Implant?", message: "Your responce will not be associated with any identifying information", preferredStyle: .Alert)
        
        // Create the actions
        
        var cancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("No Pressed")
            
            
            var quitAlert: UIAlertView = UIAlertView()
            
            quitAlert.delegate = self
            
            quitAlert.title = "If you're finished viewing your results, and you don't wish to recieve them by email tap Okay to exit this page."
            quitAlert.message = "Your results will not be recorded or shared with any third parties"
            quitAlert.addButtonWithTitle("Cancel")
            quitAlert.addButtonWithTitle("Okay")
            
            quitAlert.show()
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
            
            var quitAlert: UIAlertView = UIAlertView()
            
            quitAlert.delegate = self
            
            quitAlert.title = "If you're finished viewing your results, and you don't wish to recieve them by email tap Okay to exit this page."
            quitAlert.message = "Your results will not be recorded or shared with any third parties"
            quitAlert.addButtonWithTitle("Cancel")
            quitAlert.addButtonWithTitle("Okay")
            
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
    


