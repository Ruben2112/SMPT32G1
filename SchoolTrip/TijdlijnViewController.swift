
//  TijdlijnViewController.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 26-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation
import UIKit

class TijdlijnViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //Aantal rows
        tableView.rowHeight = 180.0
        return 7
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "AfspraakCell")
        
        if let url = NSURL(string: "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png") {
            if let data = NSData(contentsOfURL: url){
                cell.imageView!.contentMode = UIViewContentMode.ScaleAspectFit
                cell.imageView!.image = UIImage(data: data)
            }
        }

        
        
        return cell;
    }
}

