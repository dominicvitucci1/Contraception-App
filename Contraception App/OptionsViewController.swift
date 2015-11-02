//
//  OptionsViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 6/2/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit
import Parse
import Bolts



class OptionsViewController: UITableViewController {
    
    
    var options : NSArray = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 70
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "Options Background"))
        
        options = [NSLocalizedString("Intrauterine Device", comment: ""), NSLocalizedString("Implant", comment: ""), NSLocalizedString("Birth Control Shot", comment: ""), NSLocalizedString("Vaginal Ring", comment: ""), NSLocalizedString("Patch", comment: ""), NSLocalizedString("Pill", comment: ""), NSLocalizedString("Mini-Pill", comment: ""), NSLocalizedString("Condom – Male and Female", comment: ""), NSLocalizedString("Spermicide", comment: ""), NSLocalizedString("Sponge with Spermicide", comment: ""), NSLocalizedString("Emergency Contraception", comment: "")]
        
        
        self.tableView.reloadData()
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "Top Bar"))
        
        var titleView : UIImageView
        // set the dimensions you want here
        titleView = UIImageView(frame:CGRectMake(0, 0, 320, 44))
        // Set how do you want to maintain the aspect
        titleView.contentMode = .ScaleAspectFit
        titleView.image = UIImage(named: "Top Bar")
        
        self.navigationItem.titleView = titleView

    

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
        
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor.clearColor()
        }
            
        else {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
            cell.detailTextLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
            
        }
        
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.detailTextLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont.systemFontOfSize(20)
        //cell.accessoryView = UIButton.buttonWithType()
        
        // Feeds dictionary.
        //var dict : NSDictionary! = options.objectAtIndex(indexPath.row) as? NSDictionary
        
        // Set cell properties.
        let row = indexPath.row
        cell.textLabel?.text = options[row] as? String
        
        // It seems that cell.textLabel?.text is no longer an optionional.
        // If the above line throws an error then comment it out and uncomment the below line.
        //cell.textLabel?.text = options.objectAtIndex(indexPath.row).objectForKey("title") as? String
        
        //cell.detailTextLabel?.text = options.objectAtIndex(indexPath.row).objectForKey("pubDate") as? String
        
        
        
        return cell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        if segue.identifier == "openPage" {
            
                if let destination = segue.destinationViewController as? FeedPageViewController {
                    if let index = tableView.indexPathForSelectedRow?.row {
                        destination.selectedFeedTitle = options[index] as! String
                        
                    }
                }

        }
    }

}
