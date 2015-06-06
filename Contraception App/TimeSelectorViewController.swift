//
//  TimeSelectorViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 5/30/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit

class TimeSelectorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var time: NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        time = ["Weekly", "Monthly", "Yearly"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return time.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(time[row])"
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
