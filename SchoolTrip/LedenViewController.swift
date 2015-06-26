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
    
    var leden = Constants.getLeden()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leden = Constants.getLeden()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //TableView vullen
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //Aantal rows
        return leden.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "AfspraakCell")
        
        cell.textLabel?.text = leden[indexPath.row].naam
        
        return cell;
    }
    
    
    //func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //   var view : LidViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LidViewController") as! LidViewController
    //     self.presentViewController(view, animated: true, completion: nil)
    //  }

    
    
}