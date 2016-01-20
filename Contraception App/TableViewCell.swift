//
//  TableViewCell.swift
//  My Choice Navigating Contraception
//
//  Created by Dominic Vitucci on 1/20/16.
//  Copyright © 2016 Dominic Vitucci. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var isObserving = false;
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoView: UITextView!
    
    class var expandedHeight: CGFloat { get { return 400 } }
    class var defaultHeight: CGFloat  { get { return 100  } }
    
    func checkHeight() {
        infoView.hidden = (frame.size.height < TableViewCell.expandedHeight)
    }
    
    func watchFrameChanges() {
        if !isObserving {
            addObserver(self, forKeyPath: "frame", options: [NSKeyValueObservingOptions.New, NSKeyValueObservingOptions.Initial], context: nil)
            isObserving = true;
        }
    }
    
    func ignoreFrameChanges() {
        if isObserving {
            removeObserver(self, forKeyPath: "frame")
            isObserving = false;
        }
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "frame" {
            checkHeight()
        }
    }
    
    
}
