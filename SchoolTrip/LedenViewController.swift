//
//  LedenViewController.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 19-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation
import UIKit

class LedenViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //TableView vullen
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //Aantal rows
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "AfspraakCell")
        
        cell.textLabel?.text = "Leden"
        
        return cell;
    }
    
    
    //func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //   var view : LidViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LidViewController") as! LidViewController
    //     self.presentViewController(view, animated: true, completion: nil)
    //  }

    
    
}