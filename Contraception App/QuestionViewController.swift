//
//  QuestionViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 6/2/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var dailyButton: CheckBox!
    
    @IBOutlet weak var weeklyButton: CheckBox!
    
    @IBOutlet weak var monthlyButton: CheckBox!

    @IBOutlet weak var threeMonthButton: CheckBox!
    
    @IBOutlet weak var doneButton: UIButton!
    
    var durations: NSMutableArray = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        durations = []
        
       
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
        
        durations.addObject("3 Year")
        durations.addObject("5 Year")
        durations.addObject("Ten Year")
        
        
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        if segue.identifier == "donePressed" {
            
            if let destination = segue.destinationViewController as? DetailViewController {
                
              destination.selected = durations
                
                
                
                
            }
            
    

    }

}

}



