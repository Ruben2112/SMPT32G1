
//  TijdlijnViewController.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 26-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation
import UIKit

class TijdlijnViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var afbeeldingen : [AFBEELDING] = []
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.afbeeldingen = Constants.getAfbeeldingen()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //Aantal rows
        tableView.rowHeight = 180.0
        return self.afbeeldingen.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "AfspraakCell")
        
        var pic = self.afbeeldingen[indexPath.row].url
        
        if let url = NSURL(string: pic) {
            if let data = NSData(contentsOfURL: url){
                cell.imageView!.contentMode = UIViewContentMode.ScaleAspectFill
                cell.imageView!.image = UIImage(data: data)
            
            }
        }

        
        
        return cell;
    }
    @IBAction func AddPicture(sender: AnyObject) {
        
        var a = AFBEELDING(id: "4", lidId: "1", datum: "12-12-2015", url: "http://www.historien.nl/wp-content/uploads/2013/11/sinterklaas.jpg", verwijderd: "1")
        
        self.afbeeldingen.append(a)
        self.tableview.reloadData()
        
    }
}

