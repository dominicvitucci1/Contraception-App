//
//  FeedPageViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 6/2/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit

class FeedPageViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var feedImage: UIImageView!
    
    @IBOutlet weak var yesButton2: UIButton!
    
    @IBOutlet weak var noButton2: UIButton!
    
    @IBOutlet weak var moreLabel2: UILabel!
    
    
    var selectedFeedTitle = String()
    var selectedFeedFeedContent = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        textView.editable = false
        textView.contentInset = UIEdgeInsets(top: +60,left: 0,bottom: 0,right: 0)
        // Populate Text Area
        textLabel.text = "\(selectedFeedTitle)"
        textView.text = "\(selectedFeedFeedContent)"
        
        yesButton2.hidden = true
        noButton2.hidden = true
        moreLabel2.hidden = true
        
        switch selectedFeedTitle {
            
            case "Hormone-Based Pills":
                feedImage.image = UIImage(named: "Get Started")
            
            case "Patch":
                feedImage.image = UIImage(named: "Options Background")
            
            case "IUD":
                feedImage.image = UIImage(named: "Get Started")
            
        default:
            feedImage.image = nil
            
            
            
        }
        
        
        // Do any additional setup after loading the view.
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
