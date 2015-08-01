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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSUserDefaults.standardUserDefaults().removeObjectForKey("Final Results")
        
        println( NSUserDefaults.standardUserDefaults().objectForKey("Final Results"))
        
        NSUserDefaults.standardUserDefaults().setObject(false, forKey: "popup")
        
        println( NSUserDefaults.standardUserDefaults().objectForKey("popup"))
        
        PFUser.logOut()

        
        //self.navigationController?.navigationItem.backBarButtonItem
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        //navigationItem.titleView = UIImageView(image: UIImage(named: "Top Bar"))
        
//        var titleView : UIImageView
//        // set the dimensions you want here
//        titleView = UIImageView(frame:CGRectMake(0, 0, 320, 44))
//        // Set how do you want to maintain the aspect
//        titleView.contentMode = .ScaleAspectFit
//        titleView.image = UIImage(named: "Top Bar")
//        
//        self.navigationItem.titleView = titleView
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

