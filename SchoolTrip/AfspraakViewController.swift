//
//  AfspraakViewController.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 19-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation
import UIKit

class AfspraakViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var TableViewAfspraak: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableViewAfspraak.delegate = self
        
        println("Afspraak controller")
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
        
        cell.textLabel?.text = Constants.getAfbeeldingUrl()
        
        return cell;
    }
    
    
}