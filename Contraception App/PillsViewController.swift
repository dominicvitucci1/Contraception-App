//
//  PillsViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 6/4/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit

class PillsViewController: UIViewController {
    
    @IBOutlet weak var initialLabel: UILabel!
    
    @IBOutlet weak var yesButton: UIButton!
    
    @IBOutlet weak var noButton: UIButton!
    
    
    @IBOutlet weak var check1: CheckBox!
    
    @IBOutlet weak var check2: CheckBox!

    @IBOutlet weak var check3: CheckBox!
    
    @IBOutlet weak var check4: CheckBox!
    
    @IBOutlet weak var check5: CheckBox!
    
    @IBOutlet weak var check6: CheckBox!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var label6: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var nextTwoButton: UIButton!
    
    @IBOutlet weak var nextThreeButton: UIButton!
    
    @IBOutlet weak var nextFourButton: UIButton!
    
    
    var tempSelect: NSMutableArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        println(tempSelect)
        
        
        nextTwoButton.hidden = true
        nextThreeButton.hidden = true
        nextFourButton.hidden = true
        yesButton.hidden = true
        noButton.hidden = true
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
        
        if check1.selected == true || check2.selected == true || check3.selected == true || check4.selected == true || check5.selected == true || check6.selected == true {
            
            tempSelect.removeObject("Daily")
            
            let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("detailController") as! DetailViewController
            
            detailController.selected = tempSelect
            
            self.presentViewController(detailController, animated: true, completion: nil)
 
        }
        
        else {
            
            label1.text = "Do you have a condition that causes you to develop blood clots more easily?"
            
            label2.text = "Do you have kidney disease? Do you have retinal disease of the eye?"
            
            label3.text = "Have you had diabetes for over 20 years?"
            
            label4.text = "Do you have any disease of your blood vessels?"
            
            label5.text = "Do you have numbness, tingling, and pain in your hands or feet?"
            
            label6.text = "Do you have gallbladder disease and have not had your gallbladder removed?"
            
            nextButton.hidden = true
            
            nextTwoButton.hidden = false
        }
        
    }
    
    @IBAction func nextTwoButtonPressed(sender: AnyObject) {
        
        if check1.selected == true || check2.selected == true || check3.selected == true || check4.selected == true || check5.selected == true || check6.selected == true {
            
            tempSelect.removeObject("Daily")
            
            let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("detailController") as! DetailViewController
            
            detailController.selected = tempSelect
            
            self.presentViewController(detailController, animated: true, completion: nil)
        
    }
        
        else {
            
            
            label1.text = "Do you have a history of a heart attack or chest pain due to heart disease?"
            
            label2.text = "Have you ever been told that you have heart disease or heart failure?"
            
            label3.text = ""
            
            label4.text = ""
            
            label5.text = ""
            
            label6.text = ""
            
            check3.hidden = true
            check4.hidden = true
            check5.hidden = true
            check6.hidden = true
            
            
            nextTwoButton.hidden = true
            nextThreeButton.hidden = false

            
            
        }
}
    
    
    @IBAction func nextThreeButtonPressed(sender: AnyObject) {
        
        if check1.selected == true || check2.selected == true || check3.selected == true || check4.selected == true || check5.selected == true || check6.selected == true {
            
            tempSelect.removeObject("Daily")
            tempSelect.removeObject("Weekly")
            tempSelect.removeObject("Monthly")
            tempSelect.removeObject("Three Month")
            tempSelect.removeObject("3 Year")
            
            
            let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("detailController") as! DetailViewController
            
            detailController.selected = tempSelect
            
            self.presentViewController(detailController, animated: true, completion: nil)
            
        }
            
        else {
            
            
            label1.text = "Have you ever had a stroke?"
            
            label2.text = "Do you have lupus erythematosis with positive antiphospholipid antibodies?"
            
            label3.text = "Do you have migraine headaches? Do you have warning signs before you have the migraine headache?"
            
            label4.text = "Have you ever had breast cancer?"
            
            label5.text = "Do you have liver disease, a liver tumor, or liver cancer?"
            
            label6.text = "Have you ever been told that you have scarring of the liver?"
            
            check3.hidden = false
            check4.hidden = false
            check5.hidden = false
            check6.hidden = false
            
            
            nextThreeButton.hidden = true
            nextFourButton.hidden = false

    }
    }

    @IBAction func nextFourButtonPressed(sender: AnyObject) {
        
        if check1.selected == true || check2.selected == true || check3.selected == true || check4.selected == true || check5.selected == true || check6.selected == true {
            
            tempSelect.removeObject("Daily")
            tempSelect.removeObject("Weekly")
            tempSelect.removeObject("Monthly")
            tempSelect.removeObject("Three Month")
            tempSelect.removeObject("3 Year")
            
            
            let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("detailController") as! DetailViewController
            
            detailController.selected = tempSelect
            
            self.presentViewController(detailController, animated: true, completion: nil)
            
        }
            
        else {
            
            
            label1.hidden = true
            label2.hidden = true
            label3.hidden = true
            label4.hidden = true
            label5.hidden = true
            label6.hidden = true
            
            check1.hidden = true
            check2.hidden = true
            check3.hidden = true
            check4.hidden = true
            check5.hidden = true
            check6.hidden = true
            
            nextFourButton.hidden = true
            
            yesButton.hidden = false
            noButton.hidden = false
            
            initialLabel.text = "Are you taking any of these medications that are used for tuberculosis (TB) or seizures? Rifampin, Rifabutin, Phenobarbitol/barbituates (Lumina, Barbital, Solfoton), Primidone (Mysoline), Phenytoin (Dilantin), Lamotrigine (Lamictal) Carbamazepine (Tegretol) Topiramate (Topamax)"
            
            initialLabel.font = UIFont(name: initialLabel.font.fontName, size: 20)
            
            
        }

    }
    
    
    @IBAction func yesPressed(sender: AnyObject) {
        tempSelect.removeObject("Daily")
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("detailController") as! DetailViewController
        
        detailController.selected = tempSelect
        
        self.presentViewController(detailController, animated: true, completion: nil)
        
    }
    
    @IBAction func noPressed(sender: AnyObject) {
        tempSelect.removeObject("Daily")
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("detailController") as! DetailViewController
        
        detailController.selected = tempSelect
        detailController.finalResults.addObject("Pills")
        
        self.presentViewController(detailController, animated: true, completion: nil)
        
    }

        
}
    
    
    
    


