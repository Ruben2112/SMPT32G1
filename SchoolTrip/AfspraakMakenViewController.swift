//
//  AfspraakMakenViewController.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 19-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation
import UIKit

class AfspraakMakenViewController : UIViewController, UIPickerViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        println("Afspraak maken controller")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "Attractie - Sprookjesbos"
    }
    
    @IBAction func btnSave(sender: AnyObject) {
        
        navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
}
