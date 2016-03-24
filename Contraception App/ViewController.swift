//
//  ViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 5/30/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit
import Parse
import Bolts

class ViewController: BaseViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var getStartedLabel: UILabel!
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    @IBOutlet weak var disclaimerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let langSelect = NSUserDefaults.standardUserDefaults().objectForKey("langSelect") as! Bool
        
        NSUserDefaults.standardUserDefaults().removeObjectForKey("Final Results")
        
        print( NSUserDefaults.standardUserDefaults().objectForKey("Final Results"))
        
        NSUserDefaults.standardUserDefaults().setObject(false, forKey: "popup")
        
        if (langSelect != true) {
        
        NSUserDefaults.standardUserDefaults().setObject(false, forKey: "startDisplay")
        }
        
        print( NSUserDefaults.standardUserDefaults().objectForKey("popup"))
        
//        welcomeLabel.text = NSLocalizedString("Welcome \nto", comment: "")
//        getStartedLabel.text = NSLocalizedString("Press \"Get Started\" to begin.", comment: "")
//        getStartedButton.titleLabel?.text = NSLocalizedString("Get Started", comment: "")
        disclaimerButton.titleLabel?.text = NSLocalizedString("THIS APP DOES NOT PROVIDE MEDICAL ADVICE.  For additional information, please see our full disclaimer.", comment: "")
        
        PFUser.logOut()

        
        //self.navigationController?.navigationItem.backBarButtonItem
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "Top Bar"))
        
        var titleView : UIImageView
        // set the dimensions you want here
        titleView = UIImageView(frame:CGRectMake(0, 0, 320, 44))
        // Set how do you want to maintain the aspect
        titleView.contentMode = .ScaleAspectFit
        titleView.image = UIImage(named: "Top Bar")
        
        self.navigationItem.titleView = titleView
    
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        let display = NSUserDefaults.standardUserDefaults().objectForKey("startDisplay") as! Bool
        var localeString:String?
        
        if (display != true) {
        
        let myActionSheet = UIAlertController (title: "Please Select Your Language", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionOne = UIAlertAction (title: "English", style: .Default, handler: { (action) in
            print("EN")
            
            localeString = "en"
            if localeString != nil {
                NSNotificationCenter.defaultCenter().postNotificationName("LANGUAGE_WILL_CHANGE", object: localeString)
            }
            
            NSUserDefaults.standardUserDefaults().setObject(true, forKey: "startDisplay")
            NSUserDefaults.standardUserDefaults().setObject(true, forKey: "langSelect")

            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Main") 
            self.navigationController?.pushViewController(viewController, animated: false)
            
        })
        let actionTwo = UIAlertAction (title: "Spanish", style: .Default, handler: { (action) in
            print("ES")
            
            localeString = "es"
            if localeString != nil {
                NSNotificationCenter.defaultCenter().postNotificationName("LANGUAGE_WILL_CHANGE", object: localeString)
            }
            
            NSUserDefaults.standardUserDefaults().setObject(true, forKey: "startDisplay")
            NSUserDefaults.standardUserDefaults().setObject(true, forKey: "langSelect")
            
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Main") 
            self.navigationController?.pushViewController(viewController, animated: false)

            
        })
        
//        let actionCancel = UIAlertAction (title: "Cancel", style: .Cancel, handler: { (action) in
//            print("test2")
//        })
        
        myActionSheet.addAction(actionOne)
        myActionSheet.addAction(actionTwo)
        //myActionSheet.addAction(actionCancel)
        
        self.presentViewController(myActionSheet, animated: true, completion: nil)
        
    }
    }
    
    override func languageDidChangeNotification(notification:NSNotification){
        languageDidChange()
    }
    
    override func languageDidChange(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func createActionSheet(sender: AnyObject) {
//        
//        let myActionSheet = UIAlertController (title: "Please Select Your Language", message: "Test message", preferredStyle: UIAlertControllerStyle.Alert)
//        
//        let actionOne = UIAlertAction (title: "English", style: .Default, handler: { (action) in
//            println("test0")
//        })
//        let actionTwo = UIAlertAction (title: "Spanish", style: .Default, handler: { (action) in
//            println("test1")
//        })
//        
//        let actionCancel = UIAlertAction (title: "Cancel", style: .Cancel, handler: { (action) in
//            println("test2")
//        })
//        
//        myActionSheet.addAction(actionOne)
//        myActionSheet.addAction(actionTwo)
//        myActionSheet.addAction(actionCancel)
//        
//        self.presentViewController(myActionSheet, animated: true, completion: nil)
//    }
    


}

