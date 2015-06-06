//
//  LongActingViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 6/2/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit

class LongActingViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var yesButton: UIButton!
    
    @IBOutlet weak var noButton: UIButton!
    
    var labelText = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelText = "Do you know there are long acting reversible contraceptives"
        
        questionLabel.text = "\(labelText)"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yesQuestionOne(sender: AnyObject) {
       
        if let text = questionLabel.text {
            
            switch text {
                case "Do you know there are long acting reversible contraceptives":
                    questionLabel.text = "Do you want to know more about them?"
                
                case "Do you want to know more about them?":
                    let feedController = self.storyboard!.instantiateViewControllerWithIdentifier("FeedController") as! FeedPageViewController
//                    feedController.moreLabel2.hidden = false
//                    feedController.yesButton2.hidden = false
//                    feedController.noButton2.hidden = false
                    feedController.selectedFeedTitle = "IUD"
                    feedController.selectedFeedFeedContent = "TEST 3"
                
                //self.presentViewController(feedController, animated: true, completion: nil)

                self.navigationController!.pushViewController(feedController, animated: true)
                
                    //questionLabel.text = "What are Long-acting reversible contraceptives? Long-acting reversible contraceptives (LARC) or long-acting reversible birth control are methods of birth control that provide prevent pregnancy for a long period of time - up to 10 years for some methods! LARC include implants and intrauterine devices (IUD). What are the advantages of using LARCs? The advantages of using LARCs is that they are safe, reliable. and reversible. Using LARCs is better at preventing pregnancy because you would use the birth control method consistently and correctly without having to think about it. It does not require taking a pill every day or doing something every time before having sex. Most important, almost all women can use implants and IUDs even teenagers."
                
            default:
                questionLabel.text = "error"
                
            }
            
        }
        
        
    }
    
    @IBAction func noQuestionOne(sender: AnyObject) {
        
        if let text = questionLabel.text {
            
            switch text {
            case "Do you know there are long acting reversible contraceptives":
                questionLabel.text = "Do you want to know more about them?"
                
            case "Do you want to know more about them?":
                let yesController = self.storyboard!.instantiateViewControllerWithIdentifier("YesController") as! QuestionViewController
                
                self.navigationController!.pushViewController(yesController, animated: true)
                
            default:
                questionLabel.text = "error"
        
        
            }
        }
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
