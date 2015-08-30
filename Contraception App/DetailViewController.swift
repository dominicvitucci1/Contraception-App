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
        
        resultsButton.hidden = true
        
        println(selected)
        
        if selected.containsObject("Daily") {
            questionSet = "Daily"
            detailLabel.text = "Would you remember to take a pill at the same time everyday?"
        }
        
        else if selected.containsObject("Weekly") {
            questionSet = "Weekly"
            detailLabel.text = "Do you have sensitive skin with adhesives such as tape?"
        }
        
        else if selected.containsObject("Monthly") {
            questionSet = "Monthly"
            detailLabel.text = "Would you be willing to put your fingers inside your vagina to insert your birth control?"
        }
        
        else if selected.containsObject("Three Month") {
            questionSet = "Three Month"
            detailLabel.text = "Would you it bother you to get an injection (shot) every 3 months?"
        }
        
        else if selected.containsObject("3 Year") {
            questionSet = "3 Year"
            detailLabel.text = "Would it bother you to have an implant put just under your skin?"
        }
        
        else if selected.containsObject("5 Year") {
            questionSet = "5 Year"
            detailLabel.text = "Are you being treated for any sexually transmitted infections (STIs)? Do you have a lot of vaginal bleeding? Do you have unusual vaginal bleeding and not know why? \n\nIf the answer is “yes” to one or more of the above questions, please select “yes”."
            detailLabel.font = UIFont.systemFontOfSize(22)
            
        }
        
        else if selected.containsObject("Ten Year") {
            questionSet = "Ten Year"
            detailLabel.text = "Do you want to have fewer periods?"
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
            case "Would you remember to take a pill at the same time everyday?":
                detailLabel.text = "￼Have you had weight reduction surgery that shortens the length of your small intestine?"
                
            case "￼Have you had weight reduction surgery that shortens the length of your small intestine?":
                selected.removeObject("Daily")
                println(selected)
                
                viewDidLoad()
 
            default:
                detailLabel.text = "error"
                
                }
            
            }
            
            else if questionSet == "Weekly" {
                
                switch text {
                case "Do you have sensitive skin with adhesives such as tape?":
                    selected.removeObject("Weekly")
                    println(selected)
                    
                    viewDidLoad()
                
                
                default:
                    detailLabel.text = "error"
                    
                }

                
            }
            
            else if questionSet == "Monthly" {
                
                switch text {
                case "Would you be willing to put your fingers inside your vagina to insert your birth control?":
                    selected.removeObject("Monthly")
                    finalResults.addObject("Vaginal Ring")
                    println(selected)
                    println(finalResults)
                    viewDidLoad()
                
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
            
            else if questionSet == "Three Month" {
                
                switch text {
                case "Would you it bother you to get an injection (shot) every 3 months?":
                    selected.removeObject("Three Month")
                    shotAns = 1
                    println(selected)
                    viewDidLoad()
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
            
            else if questionSet == "3 Year" {
                
                switch text {
                case "Would it bother you to have an implant put just under your skin?":
                    selected.removeObject("3 Year")
                    implantAns = 1
                    println(selected)
                    viewDidLoad()
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
            
            else if questionSet == "5 Year" {
                
                switch text {
                case "Are you being treated for any sexually transmitted infections (STIs)? Do you have a lot of vaginal bleeding? Do you have unusual vaginal bleeding and not know why? \n\nIf the answer is “yes” to one or more of the above questions, please select “yes”.":
                    selected.removeObject("5 Year")
                    selected.removeObject("Ten Year")
                    iudAns = 1
                    println(selected)
                    viewDidLoad()
                    
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
            
            else if questionSet == "Ten Year" {
                
                switch text {
                case "Do you want to have fewer periods?":
                    detailLabel.text = "Would you be opposed to having some side effects such as spotting during the initial few months after beginning a new method of birth control?"
                    
                case "Would you be opposed to having some side effects such as spotting during the initial few months after beginning a new method of birth control?":
                    selected.removeObject("Ten Year")
                    finalResults.removeObject("Implant")
                    finalResults.removeObject("Birth Control Shot")
                    finalResults.removeObject("Intrauterine Device")
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
                case "Would you remember to take a pill at the same time everyday?":
                    selected.removeObject("Daily")
                    println(selected)
                    
                    viewDidLoad()
                    
                case "￼Have you had weight reduction surgery that shortens the length of your small intestine?":
                    finalResults.addObject("Pill")
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
                case "Do you have sensitive skin with adhesives such as tape?":
                    selected.removeObject("Weekly")
                    finalResults.addObject("Patch")
                    println(selected)
                    
                    viewDidLoad()
                    
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
                
            else if questionSet == "Monthly" {
                
                switch text {
                case "Would you be willing to put your fingers inside your vagina to insert your birth control?":
                    selected.removeObject("Monthly")
                    println(selected)
                    viewDidLoad()
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
                
            else if questionSet == "Three Month" {
                
                switch text {
                case "Would you it bother you to get an injection (shot) every 3 months?":
                    selected.removeObject("Three Month")
                    finalResults.addObject("Birth Control Shot")
                    shotAns = 1
                    println(selected)
                    viewDidLoad()
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
                
            else if questionSet == "3 Year" {
                
                switch text {
                case "Would it bother you to have an implant put just under your skin?":
                    selected.removeObject("3 Year")
                    finalResults.addObject("Implant")
                    implantAns = 1
                    println(selected)
                    viewDidLoad()
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
                
            else if questionSet == "5 Year" {
                
                switch text {
                case "Are you being treated for any sexually transmitted infections (STIs)? Do you have a lot of vaginal bleeding? Do you have unusual vaginal bleeding and not know why? \n\nIf the answer is “yes” to one or more of the above questions, please select “yes”.":
                    selected.removeObject("5 Year")
                    finalResults.addObject("Intrauterine Device")
                    iudAns = 1
                    println(selected)
                    viewDidLoad()
                    
                    
                default:
                    detailLabel.text = "error"
                    
                }
                
                
            }
            
            else if questionSet == "Ten Year" {
                
                switch text {
                case "Do you want to have fewer periods?":
                    selected.removeObject("Ten Year")
//                    finalResults.removeObject("Implant")
//                    finalResults.removeObject("Birth Control Shot")
//                    finalResults.removeObject("Intrauterine Device")
                    
                    finalResults.removeObject("")
                    finalResults.removeObject("")
                    finalResults.removeObject("")

                    viewDidLoad()
                    
                case "Would you be opposed to having some side effects such as spotting during the initial few months after beginning a new method of birth control?":
                    selected.removeObject("Ten Year")
                    
                    if implantAns == 0 {
                    finalResults.addObject("Implant")
                    }
                    if shotAns == 0 {
                    finalResults.addObject("Birth Control Shot")
                    }
                    if iudAns == 0 {
                    finalResults.addObject("Intrauterine Device")
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
