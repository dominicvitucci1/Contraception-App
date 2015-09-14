//
//  DisclaimerViewController.swift
//  My Choice Navigating Contraception
//
//  Created by Dominic Vitucci on 9/10/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit

class DisclaimerViewController: UIViewController {

    @IBOutlet weak var disclaimerLabel: UILabel!
    
    @IBOutlet weak var disclaimerText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        disclaimerLabel.text = NSLocalizedString("Disclaimer", comment: "")
//        disclaimerText.text = NSLocalizedString("This application (app) does not provide specific medical advice and does not endorse any medical or professional service obtained through information provided on this app or any links provided. It is intended for general informational purposes only. Use of this app does not replace medical consultation with a qualified health or medical professional to meet the health and medical needs of you or others. Never ignore professional medical advice in seeking treatment because of something that you have read on this app. If you think you may have a medical emergency, please dial 911. While the content of this app is periodically updated, medical information changes rapidly and therefore, some information may be out of date, and/or contain inaccuracies or typographical errors.", comment: "")
        

        // Do any additional setup after loading the view.
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
