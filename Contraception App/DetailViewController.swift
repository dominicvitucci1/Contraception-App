//
//  DetailViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 6/3/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var yesButton: UIButton!
    
    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var resultsButton: UIButton!
    
    var selected: NSMutableArray = []
    
    var finalResults: NSMutableArray = []
    
    var questionSet = ""
    
    var implantAns = 0
    
    var shotAns = 0
    
    var iudAns = 0
    

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

        
        resultsButton.hidden = true
        
        print(selected)
        
        if selected.containsObject("Daily") {
            questionSet = "Daily"
            detailLabel.text = NSLocalizedString("Would you remember to take a pill at the same time everyday?", comment: "")
        }
        
        else if selected.containsObject("Weekly") {
            questionSet = "Weekly"
            detailLabel.text = NSLocalizedString("Do you have sensitive skin with adhesives such as tape?", comment: "")
        }
        
        else if selected.containsObject("Monthly") {
            questionSet = "Monthly"
            detailLabel.text = NSLocalizedString("Would you be willing to put your fingers inside your vagina to insert your birth control?", comment: "")
        }
        
        else if selected.containsObject("Three Month") {
            questionSet = "Three Month"
            detailLabel.text = NSLocalizedString("Would you it bother you to get an injection (shot) every 3 months?", comment: "")
        }
        
        else if selected.containsObject("3 Year") {
            questionSet = "3 Year"
            detailLabel.text = NSLocalizedString("Would it bother you to have an implant put just under your skin?", comment: "")
        }
        
        else if selected.containsObject("5 Year") {
            questionSet = "5 Year"
            detailLabel.text = NSLocalizedString("Are you being treated for any sexually transmitted infections (STIs)? Do you have a lot of vaginal bleeding? Do you have unusual vaginal bleeding and not know why? \n\nIf the answer is “yes” to one or more of the above questions, please select “yes”.", comment: "")
            detailLabel.font = UIFont.systemFontOfSize(22)
            
        }
        
        else if selected.containsObject("Ten Year") {
            questionSet = "Ten Year"
            detailLabel.text = NSLocalizedString("Would you be opposed to having some side effects such as spotting during the initial few months after beginning a new method of birth control?", comment: "")
            //detailLabel.text = NSLocalizedString("Do you want to have fewer periods?", comment: "")
            detailLabel.font = UIFont.systemFontOfSize(32)
        }
        
        else {
            questionSet = ""
            detailLabel.text = ""
            resultsButton.hidden = false
            yesButton.hidden = true
            noButton.hidden = true
        }
        
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton


        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func yesAnswer(sender: AnyObject) {
        
        
        if let text = detailLabel.text {
            if questionSet == "Daily" {
            
            switch text {
            case NSLocalizedString("Would you remember to take a pill at the same time everyday?", comment: ""):
                detailLabel.text = NSLocalizedString("￼Have you had weight reduction surgery that shortens the length of your small intestine?", comment: "")
                
            case NSLocalizedString("￼Have you had weight reduction surgery that shortens the length of your small intestine?", comment: ""):
                selected.removeObject("Daily")
                print(selected)
                
                viewDidLoad()
 
            default:
                detailLabel.text = "error"
                
                }
            
            }
            
            else if questionSet == "Weekly" {
                
                switch text {
                case NSLocalizedString("Do you have sensitive skin with adhesives such as tape?", comment: ""):
                    selected.removeObject("Weekly")
                    print(selected)
                    
                    viewDidLoad()
                
                
                default:
                    detailLabel.text = "error"
                    
                }

                
            }
            
            else if questionSet == "Monthly" {
                
                switch text {
                case NSLocalizedString("Would you be willing to put your fingers inside your vagina to insert your birth control?", comment: ""):
                    selected.removeObject("Monthly")
                    finalResults.addObject(NSLocalizedString("Vaginal Ring", comment: ""))
                    print(selected)
                    print(finalResults)
                    viewDidLoad()
                
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
            
            else if questionSet == "Three Month" {
                
                switch text {
                case NSLocalizedString("Would you it bother you to get an injection (shot) every 3 months?", comment: ""):
                    selected.removeObject("Three Month")
                    shotAns = 1
                    print(selected)
                    viewDidLoad()
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
            
            else if questionSet == "3 Year" {
                
                switch text {
                case NSLocalizedString("Would it bother you to have an implant put just under your skin?", comment: ""):
                    selected.removeObject("3 Year")
                    implantAns = 1
                    print(selected)
                    viewDidLoad()
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
            
            else if questionSet == "5 Year" {
                
                switch text {
                case NSLocalizedString("Are you being treated for any sexually transmitted infections (STIs)? Do you have a lot of vaginal bleeding? Do you have unusual vaginal bleeding and not know why? \n\nIf the answer is “yes” to one or more of the above questions, please select “yes”.", comment: ""):
                    selected.removeObject("5 Year")
                    selected.removeObject("Ten Year")
                    iudAns = 1
                    print(selected)
                    viewDidLoad()
                    
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
            
            else if questionSet == "Ten Year" {
                
                switch text {
                case NSLocalizedString("Do you want to have fewer periods?", comment: ""):
                    detailLabel.text = NSLocalizedString("Would you be opposed to having some side effects such as spotting during the initial few months after beginning a new method of birth control?", comment: "")
                    
                case NSLocalizedString("Would you be opposed to having some side effects such as spotting during the initial few months after beginning a new method of birth control?", comment: ""):
                    selected.removeObject("Ten Year")
                    finalResults.removeObject(NSLocalizedString("Implant", comment: ""))
                    finalResults.removeObject(NSLocalizedString("Birth Control Shot", comment: ""))
                    finalResults.removeObject(NSLocalizedString("Intrauterine Device", comment: ""))
                    viewDidLoad()
                    
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }


        
        }
    }
    
    
    @IBAction func noAnswer(sender: AnyObject) {
        
        if let text = detailLabel.text {
            if questionSet == "Daily" {
                
                switch text {
                case NSLocalizedString("Would you remember to take a pill at the same time everyday?", comment: ""):
                    selected.removeObject("Daily")
                    print(selected)
                    
                    viewDidLoad()
                    
                case NSLocalizedString("￼Have you had weight reduction surgery that shortens the length of your small intestine?", comment: ""):
                    finalResults.addObject(NSLocalizedString("Pill", comment: ""))
                    //finalResults.addObject("Mini-Pill")
                    selected.removeObject("Daily")
                    viewDidLoad()
                    
                    
//                    let extendedController = self.storyboard!.instantiateViewControllerWithIdentifier("pillsController") as! PillsViewController
//                    
//                    extendedController.tempSelect = selected
//                    
//                    self.navigationController?.pushViewController(extendedController, animated: true)

                    
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
            }
                
            else if questionSet == "Weekly" {
                
                switch text {
                case NSLocalizedString("Do you have sensitive skin with adhesives such as tape?", comment: ""):
                    selected.removeObject("Weekly")
                    finalResults.addObject(NSLocalizedString("Patch", comment: ""))
                    print(selected)
                    
                    viewDidLoad()
                    
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
                
            else if questionSet == "Monthly" {
                
                switch text {
                case NSLocalizedString("Would you be willing to put your fingers inside your vagina to insert your birth control?", comment: ""):
                    selected.removeObject("Monthly")
                    print(selected)
                    viewDidLoad()
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
                
            else if questionSet == "Three Month" {
                
                switch text {
                case NSLocalizedString("Would you it bother you to get an injection (shot) every 3 months?", comment: ""):
                    selected.removeObject("Three Month")
                    finalResults.addObject(NSLocalizedString("Birth Control Shot", comment: ""))
                    shotAns = 1
                    print(selected)
                    viewDidLoad()
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
                
            else if questionSet == "3 Year" {
                
                switch text {
                case NSLocalizedString("Would it bother you to have an implant put just under your skin?", comment: ""):
                    selected.removeObject("3 Year")
                    finalResults.addObject(NSLocalizedString("Implant", comment: ""))
                    implantAns = 1
                    print(selected)
                    viewDidLoad()
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
                
            else if questionSet == "5 Year" {
                
                switch text {
                case NSLocalizedString("Are you being treated for any sexually transmitted infections (STIs)? Do you have a lot of vaginal bleeding? Do you have unusual vaginal bleeding and not know why? \n\nIf the answer is “yes” to one or more of the above questions, please select “yes”.", comment: ""):
                    selected.removeObject("5 Year")
                    finalResults.addObject(NSLocalizedString("Intrauterine Device", comment: ""))
                    iudAns = 1
                    print(selected)
                    viewDidLoad()
                    
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
            
            else if questionSet == "Ten Year" {
                
                switch text {
                case NSLocalizedString("Do you want to have fewer periods?", comment: ""):
                    selected.removeObject("Ten Year")
//                    finalResults.removeObject("Implant")
//                    finalResults.removeObject("Birth Control Shot")
//                    finalResults.removeObject("Intrauterine Device")
                    
                    finalResults.removeObject("")
                    finalResults.removeObject("")
                    finalResults.removeObject("")

                    viewDidLoad()
                    
                case NSLocalizedString("Would you be opposed to having some side effects such as spotting during the initial few months after beginning a new method of birth control?", comment: ""):
                    selected.removeObject("Ten Year")
                    
                    if implantAns == 0 {
                    finalResults.addObject(NSLocalizedString("Implant", comment: ""))
                    }
                    if shotAns == 0 {
                    finalResults.addObject(NSLocalizedString("Birth Control Shot", comment: ""))
                    }
                    if iudAns == 0 {
                    finalResults.addObject(NSLocalizedString("Intrauterine Device", comment: ""))
                    }
                    viewDidLoad()
                    
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
            


            
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        if segue.identifier == "viewResults" {
            
            if let destination = segue.destinationViewController as? ResultsViewController {
                
                NSUserDefaults.standardUserDefaults().setObject(finalResults, forKey: "Final Results")
                
                
                
            
            
        }
    }

    
    
    
    
    
    

    }
}
