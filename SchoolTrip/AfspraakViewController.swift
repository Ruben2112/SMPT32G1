//
//  AfspraakViewController.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 19-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation
import UIKit

class AfspraakViewController : UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet weak var TableViewAfspraak: UITableView!
    var afspraken = Constants.getAfspraken()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableViewAfspraak.delegate = self
        
        println("Afspraak controller")
        println(afspraken.count)
        self.afspraken = Constants.getAfspraken()
        
        if(self.TableViewAfspraak != nil)
        {
            self.TableViewAfspraak.reloadData()
        }
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //TableView vullen
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //Aantal rows
        return afspraken.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "AfspraakCell")
        
        cell.textLabel?.text = afspraken[indexPath.row].tijdstip
        
        return cell;
    }
    
    
    
    
}