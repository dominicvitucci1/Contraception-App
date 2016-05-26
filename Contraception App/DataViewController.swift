//
//  DataViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 7/18/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit
import Parse
import Bolts

class DataViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var ageField: UITextField!
    
    @IBOutlet weak var ethnicityField: UITextField!
    
    @IBOutlet weak var raceField: UITextField!
    
    @IBOutlet weak var assistanceField: UITextField!
    
    @IBOutlet weak var doneButton: UIButton!
    
    var picker1: UIPickerView = UIPickerView()
    var picker2: UIPickerView = UIPickerView()
    var picker3: UIPickerView = UIPickerView()
    var picker4: UIPickerView = UIPickerView()
    
    var ages: NSMutableArray = ["",NSLocalizedString("Younger than 15", comment: "Age"), NSLocalizedString("15-19", comment: "Age"), NSLocalizedString("20-24", comment: "Age"), NSLocalizedString("25-29", comment: "Age"), NSLocalizedString("30-34", comment: "Age"), NSLocalizedString("35-39", comment: "Age"), NSLocalizedString("40-44", comment: "Age"), NSLocalizedString("45-50", comment: "Age"), NSLocalizedString("Older than 50", comment: "Age")]
    var ethnicities: NSMutableArray = ["", NSLocalizedString("Hispanic or Latina", comment: "Ethnicity"), NSLocalizedString("Not Hispanic or Latina", comment: "Ethnicity")]
    var races: NSMutableArray = ["", NSLocalizedString("Black or African American", comment: "Race"), NSLocalizedString("Asian", comment: "Race"), NSLocalizedString("American Indian or Alaskan Native", comment: "Race"), NSLocalizedString("Native Hawaiian or Other Pacific Islander", comment: "Race"), NSLocalizedString("White", comment: "Race")]
    var medAssist: NSMutableArray = ["", NSLocalizedString("Yes", comment: "Medical Assitance Answer"), NSLocalizedString("No", comment: "Medical Assistance Answer")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        picker1.delegate = self
        picker1.dataSource = self
        
        picker2.delegate = self
        picker2.dataSource = self
        
        picker3.delegate = self
        picker3.dataSource = self
        
        picker4.delegate = self
        picker4.dataSource = self
        
        picker1.tag = 0
        picker2.tag = 1
        picker3.tag = 2
        picker4.tag = 3
        

        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 201/255, green: 187/255, blue: 96/255, alpha: 1)
        toolBar.sizeToFit()
        
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: #selector(DataViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        
        self.ageField.inputView = picker1
        self.ageField.inputAccessoryView = toolBar
        
        self.ethnicityField.inputView = picker2
        self.ethnicityField.inputAccessoryView = toolBar
        
        self.raceField.inputView = picker3
        self.raceField.inputAccessoryView = toolBar
        
        self.assistanceField.inputView = picker4
        self.assistanceField.inputAccessoryView = toolBar
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "Top Bar"))
        
        var titleView : UIImageView
        // set the dimensions you want here
        titleView = UIImageView(frame:CGRectMake(0, 0, 320, 44))
        // Set how do you want to maintain the aspect
        titleView.contentMode = .ScaleAspectFit
        titleView.image = UIImage(named: "Top Bar")
        
        self.navigationItem.titleView = titleView

        

        
    }
    
    func numberOfComponentsInPickerView(picker: UIPickerView) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(picker: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        if picker.tag == 0 {
            return ages.count
        } else if picker.tag == 1 {
            return ethnicities.count
        } else if picker.tag == 2 {
            return  races.count
        } else if  picker.tag == 3 {
            return medAssist.count
        }
        return 1
    }
    
    func pickerView(picker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if picker.tag == 0 {
            return ages[row] as? String
        } else if picker.tag == 1 {
            return ethnicities[row] as? String
        } else if picker.tag == 2 {
            return races[row] as? String
        } else if  picker.tag == 3 {
            return medAssist[row] as? String
        }
        return ""
    }
    
    func pickerView(picker: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        if picker.tag == 0 {
            ageField.text = ages[row] as? String
        } else if picker.tag == 1 {
            ethnicityField.text = ethnicities[row] as? String
        } else if picker.tag == 2 {
            raceField.text = races[row] as? String
        } else if picker.tag == 3 {
            assistanceField.text = medAssist[row] as? String
        }
    }
    
    func textFieldShouldBeginEditing(textField: UITextField, picker: UIPickerView) -> Bool {
        
        if picker.tag == 0 {
            picker1.hidden = false
        } else if picker.tag == 1 {
            picker2.hidden = false
        } else if picker.tag == 2 {
            picker3.hidden = false
        } else if picker.tag == 3 {
            picker4.hidden = false
        }
        return false
    }
    
    func donePicker() {
        self.view.endEditing(true)
        
    }
    
    
    @IBAction func donePressed(sender: AnyObject) {
        
        
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
            
            PFAnonymousUtils.logInWithBlock {
            (user: PFUser?, error: NSError?) -> Void in
            if error != nil || user == nil {
                print("Anonymous login failed.")
            } else {
                print("Anonymous user logged in.")
                
                let data = PFObject(className:"data")
                data["userNumber"] = PFUser.currentUser()
                data["age"] = self.ageField.text
                data["ethnicity"] = self.ethnicityField.text
                data["race"] = self.raceField.text
                data["medicalAssistance"] = self.assistanceField.text
                data.saveInBackgroundWithBlock {
                    (success: Bool, error: NSError?) -> Void in
                    if (success) {
                        // The object has been saved.
                        _ = true
                        
                        NSUserDefaults.standardUserDefaults().setObject(true, forKey: "popup")
                        
                        let mainController = self.storyboard!.instantiateViewControllerWithIdentifier("threeController") as! ThreeViewController
                        
                        self.navigationController!.pushViewController(mainController, animated: true)
                    } else {
                        // There was a problem, check error.description
                    }
                }
            }
        }
        }
            
            else {
                print("Internet connection FAILED")
                let alert = UIAlertView(title: NSLocalizedString("No Internet Connection", comment: ""), message: NSLocalizedString("Make sure your device is connected to the internet.", comment: ""), delegate: nil, cancelButtonTitle: NSLocalizedString("OK", comment: "Internet Connection Popup"))
                alert.show()
            }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
