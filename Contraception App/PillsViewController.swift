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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
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
    
    @IBOutlet weak var medField: UITextView!
    
    var tempSelect: NSMutableArray = []
    
    
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
        //scrollView.contentSize = CGSizeMake(scrollView.frame.width, scrollView.frame.height)

        
        print(tempSelect)
        
        
        nextTwoButton.hidden = true
        nextThreeButton.hidden = true
        nextFourButton.hidden = true
        yesButton.hidden = true
        noButton.hidden = true
        medField.hidden = true
        
        
//        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
//        navigationItem.leftBarButtonItem = backButton
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
        
        if check1.selected == true || check2.selected == true || check3.selected == true || check4.selected == true || check5.selected == true || check6.selected == true {
            
            tempSelect.removeObject("Daily")
            tempSelect.removeObject("Weekly")
            tempSelect.removeObject("Monthly")
            tempSelect.removeObject("Three Month")
            tempSelect.removeObject("3 Year")
            tempSelect.removeObject("5 Year")
            
            
            let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("detailController") as! DetailViewController
            
            detailController.selected = tempSelect
            
            self.navigationController?.pushViewController(detailController, animated: true)
 
        }
        
        else {
            
            label1.text = NSLocalizedString("Do you have a condition that causes you to develop blood clots more easily?", comment: "")
            
            label2.text = NSLocalizedString("Do you have kidney disease? Do you have retinal disease of the eye?", comment: "")
            
            label3.text = NSLocalizedString("Have you had diabetes for over 20 years?", comment: "")
            
            label4.text = NSLocalizedString("Do you have any disease of your blood vessels?", comment: "")
            
            label5.text = NSLocalizedString("Do you have numbness, tingling, and pain in your hands or feet?", comment: "")
            
            label6.text = NSLocalizedString("Do you have gallbladder disease and have not had your gallbladder removed?", comment: "")
            
            nextButton.hidden = true
            
            nextTwoButton.hidden = false
            
            scrollView.setContentOffset(CGPointMake(0.0, 0.0), animated: false)
        }
        
    }
    
    @IBAction func nextTwoButtonPressed(sender: AnyObject) {
        
        if check1.selected == true || check2.selected == true || check3.selected == true || check4.selected == true || check5.selected == true || check6.selected == true {
            
            tempSelect.removeObject("Daily")
            tempSelect.removeObject("Weekly")
            tempSelect.removeObject("Monthly")
            tempSelect.removeObject("Three Month")
            tempSelect.removeObject("3 Year")
            tempSelect.removeObject("5 Year")
            
            let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("detailController") as! DetailViewController
            
            detailController.selected = tempSelect
            
            self.navigationController?.pushViewController(detailController, animated: true)
        
    }
        
        else {
            
            
            label1.text = NSLocalizedString("Do you have a history of a heart attack or chest pain due to heart disease?", comment: "")
            
            label2.text = NSLocalizedString("Have you ever been told that you have heart disease or heart failure?", comment: "")
            
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
            
            scrollView.setContentOffset(CGPointMake(0.0, 0.0), animated: false)

        }
}
    
    
    @IBAction func nextThreeButtonPressed(sender: AnyObject) {
        
        if check1.selected == true || check2.selected == true || check3.selected == true || check4.selected == true || check5.selected == true || check6.selected == true {
            
            tempSelect.removeObject("Daily")
            tempSelect.removeObject("Weekly")
            tempSelect.removeObject("Monthly")
            tempSelect.removeObject("Three Month")
            tempSelect.removeObject("3 Year")
            tempSelect.removeObject("5 Year")
            
            
            let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("detailController") as! DetailViewController
            
            detailController.selected = tempSelect
            
            self.navigationController?.pushViewController(detailController, animated: true)
            
        }
            
        else {
            
            
            label1.text = NSLocalizedString("Have you ever had a stroke?", comment: "")
            
            label2.text = NSLocalizedString("Do you have lupus erythematosis with positive antiphospholipid antibodies?", comment: "")
            
            label3.text = NSLocalizedString("Do you have migraine headaches? Do you have warning signs before you have the migraine headache?", comment: "")
            
            label4.text = NSLocalizedString("Have you ever had breast cancer?", comment: "")
            
            label5.text = NSLocalizedString("Do you have liver disease, a liver tumor, or liver cancer?", comment: "")
            
            label6.text = NSLocalizedString("Have you ever been told that you have scarring of the liver?", comment: "")
            
            check3.hidden = false
            check4.hidden = false
            check5.hidden = false
            check6.hidden = false
            
            
            nextThreeButton.hidden = true
            nextFourButton.hidden = false
            
            scrollView.setContentOffset(CGPointMake(0.0, 0.0), animated: false)

    }
    }

    @IBAction func nextFourButtonPressed(sender: AnyObject) {
        
        if check1.selected == true || check2.selected == true || check3.selected == true || check4.selected == true || check5.selected == true || check6.selected == true {
            
            tempSelect.removeObject("Daily")
            tempSelect.removeObject("Weekly")
            tempSelect.removeObject("Monthly")
            tempSelect.removeObject("Three Month")
            tempSelect.removeObject("3 Year")
            tempSelect.removeObject("5 Year")
            
            
            let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("detailController") as! DetailViewController
            
            detailController.selected = tempSelect
            
            self.navigationController?.pushViewController(detailController, animated: true)
            
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
            
            medField.hidden = false
            medField.font = UIFont.systemFontOfSize(22)
            medField.textColor = UIColor.whiteColor()
            medField.editable = false
            medField.selectable = false
            
            medField.text = "\u{2022} Rifampin \n\u{2022} Rifabutin \n\u{2022} Phenobarbitol/barbituates (Lumina, Barbital, Solfoton) \n\u{2022} Primidone (Mysoline) \n\u{2022} Phenytoin (Dilantin) \n\u{2022} Lamotrigine (Lamictal) \n\u{2022} Carbamazepine (Tegretol) \n\u{2022} Topiramate (Topamax)"
            
            
            initialLabel.text = NSLocalizedString("Are you taking any of these medications that are used for tuberculosis (TB) or seizures?", comment: "")
            
//            Rifampin, Rifabutin, Phenobarbitol/barbituates (Lumina, Barbital, Solfoton), Primidone (Mysoline),Phenytoin (Dilantin), Lamotrigine (Lamictal) Carbamazepine (Tegretol) Topiramate (Topamax)
            
            initialLabel.font = UIFont(name: initialLabel.font.fontName, size: 20)
            
            scrollView.setContentOffset(CGPointMake(0.0, 0.0), animated: false)
            
            
        }

    }
    
    
    @IBAction func yesPressed(sender: AnyObject) {
        tempSelect.removeObject("Daily")
        tempSelect.removeObject("Weekly")
        tempSelect.removeObject("Monthly")
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("detailController") as! DetailViewController
        
        detailController.selected = tempSelect
        
        self.navigationController?.pushViewController(detailController, animated: true)
        
    }
    
    @IBAction func noPressed(sender: AnyObject) {
        //tempSelect.removeObject("Daily")
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("detailController") as! DetailViewController
        
        detailController.selected = tempSelect
        //detailController.finalResults.addObject("Pill")
        //detailController.finalResults.addObject("Mini-Pill")
        
        self.navigationController?.pushViewController(detailController, animated: true)
        
    }

        
}
    
    
    
    


