//
//  ThreeViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 7/18/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var display = NSUserDefaults.standardUserDefaults().objectForKey("popup") as! Bool
        
        if (display != true) {

        var dataAlertController = UIAlertController(title: "Would you like to provide us with some basic data to help improve our app?", message: "None of this data will be associated with your name or any other identifying information", preferredStyle: .Alert)
        
        // Create the actions
        
        var cancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("No Pressed")
        }
        
        var yesAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("Yes Pressed")
            
            let mainController = self.storyboard!.instantiateViewControllerWithIdentifier("dataViewController") as! DataViewController
            
            self.navigationController!.pushViewController(mainController, animated: true)

        }
        
        // Add the actions
        dataAlertController.addAction(yesAction)
        dataAlertController.addAction(cancelAction)
        
        // Present the controller
        self.presentViewController(dataAlertController, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
