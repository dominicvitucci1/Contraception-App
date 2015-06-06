//
//  ViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 5/30/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSUserDefaults.standardUserDefaults().removeObjectForKey("Final Results")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

