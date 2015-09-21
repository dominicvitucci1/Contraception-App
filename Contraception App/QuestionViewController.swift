//
//  QuestionViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 6/2/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit
import Parse
import Bolts

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var dailyButton: CheckBox!
    
    @IBOutlet weak var weeklyButton: CheckBox!
    
    @IBOutlet weak var monthlyButton: CheckBox!

    @IBOutlet weak var threeMonthButton: CheckBox!
    
    @IBOutlet weak var threeFiveYearButton: CheckBox!
    
    @IBOutlet weak var tenYearButton: CheckBox!
    
    
    
    @IBOutlet weak var doneButton: UIButton!
    
    var durations: NSMutableArray = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        durations = []
        
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

        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func donePressed(sender: AnyObject) {
        
        if dailyButton.selected == true {
            
            durations.addObject("Daily")
        }
        
        if weeklyButton.selected == true {
            durations.addObject("Weekly")
        }
        
        if monthlyButton.selected == true {
            durations.addObject("Monthly")
        }
        
        if threeMonthButton.selected == true {
            durations.addObject("Three Month")
        }
        
        if threeFiveYearButton.selected == true {
        durations.addObject("3 Year")
        durations.addObject("5 Year")
        }
        
        if tenYearButton.selected == true {
        durations.addObject("Ten Year")
        }
        
        
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        if segue.identifier == "donePressed" {
            
//            if let destination = segue.destinationViewController as? DetailViewController {
//                
//              destination.selected = durations
            
        if let destination = segue.destinationViewController as? PillsViewController {
                    
                destination.tempSelect = durations
                
                
            
                
            }
            
    

    }

}

}



