//
//  QuestionTableViewCell.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 6/3/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var checkBox: CheckBox!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
