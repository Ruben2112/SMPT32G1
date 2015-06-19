//
//  InlogViewController.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 19-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation
import UIKit

class InlogViewController : UIViewController {
    
    @IBOutlet weak var tbNaam: UITextField!
    @IBOutlet weak var tbGroepsCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Inlog controller")
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }
    
    @IBAction func Login(sender: AnyObject) {
        
        println("login button")
        println(tbNaam.text)
        println(tbGroepsCode.text)
        
    }
}