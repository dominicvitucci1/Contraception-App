//
//  ResultsViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 6/4/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var results:NSMutableArray = []
    @IBOutlet weak var printButton: UIBarButtonItem!
    
    @IBOutlet weak var textView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        results = NSUserDefaults.standardUserDefaults().objectForKey("Final Results") as! NSMutableArray
        
        println(results)
        
        textView.text = String(format:"%@", results)
        
        

    }
    
    @IBAction func printText(sender: AnyObject) {
        
        // 1
        let printController = UIPrintInteractionController.sharedPrintController()!
        // 2
        let printInfo = UIPrintInfo(dictionary:nil)!
        printInfo.outputType = UIPrintInfoOutputType.General
        printInfo.jobName = "Results"
        printController.printInfo = printInfo
        
        // 3
        let formatter = UIMarkupTextPrintFormatter(markupText: textView.text)
        formatter.contentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
        printController.printFormatter = formatter
        
        // 4
        printController.presentFromBarButtonItem(printButton, animated: true, completionHandler: nil)
        
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
