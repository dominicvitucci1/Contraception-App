//
//  ThreeViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 7/18/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {
    
    @IBOutlet weak var optionsButton: UIButton!
    
    @IBOutlet weak var hsButton: UIButton!

    @IBOutlet weak var forMeButton: UIButton!
    
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
        
        optionsButton.setImage(UIImage(named:NSLocalizedString("Options", comment: "")), forState: .Normal)
        hsButton.setImage(UIImage(named:NSLocalizedString("High School", comment: "")), forState: .Normal)
        forMeButton.setImage(UIImage(named:NSLocalizedString("For Me", comment: "")), forState: .Normal)
        
        NSUserDefaults.standardUserDefaults().setObject(false, forKey: "langSelect")
        
        let display = NSUserDefaults.standardUserDefaults().objectForKey("popup") as! Bool
        
        if (display != true) {

        let dataAlertController = UIAlertController(title: NSLocalizedString("Would you like to provide us with some basic data to help improve our app?", comment: ""), message: NSLocalizedString("None of this data will be associated with your name or any other identifying information", comment: ""), preferredStyle: .Alert)
        
        // Create the actions
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("No", comment: ""), style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("No Pressed")
        }
        
        let yesAction = UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: UIAlertActionStyle.Default) {
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
