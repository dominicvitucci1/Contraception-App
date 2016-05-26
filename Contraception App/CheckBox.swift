//
//  CheckBox.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 6/2/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

    let checked = UIImage(named: "Checked")
    let unchecked = UIImage(named: "Unchecked")
    
    var isChecked: Bool = false {
        
        didSet {
            
            if isChecked == true {
                self.setImage(checked, forState: .Normal)
                
            }
            
            else {
                
                self.setImage(unchecked, forState: .Normal)
            }
            
        }
        
    }
    
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(CheckBox.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
    }
    
     func buttonClicked(sender: UIButton) {
        
        if (sender == self) {
            if isChecked == true {
                isChecked = false
                sender.selected = !sender.selected
                
            }
            
            else {
                isChecked = true
                sender.selected = !sender.selected
            }
            
        }
        
    }

}
