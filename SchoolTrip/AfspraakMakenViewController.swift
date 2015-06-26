//
//  AfspraakMakenViewController.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 19-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation
import UIKit

class AfspraakMakenViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    
    @IBOutlet weak var POIpicker: UIPickerView!
    var POIs : [POI] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Afspraak maken controller")
        getPOI()
        
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
        return POIs.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        var soort : String
        
        switch ("1"){
        case POIs[row].attractie:
            soort = "Attractie - "
        case POIs[row].sprookjesbos:
            soort = "Sprookjesbos - "
        case POIs[row].winkel:
            soort = "Winkel - "
        case POIs[row].entertainment:
            soort = "Entertainment - "
        case POIs[row].algemeen:
            soort = "Algemeen - "
        default:
            soort = ""
        }
        
        return (soort + POIs[row].naam)
    }

    
    @IBAction func btnSave(sender: AnyObject) {
        
        navigationController?.popToRootViewControllerAnimated(true)
        
    }
    func getPOI(){
        var url = Constants.getIpAdress() + Constants.getPOIUrl()
        
        request(.GET, url, parameters: nil)
            .responseJSON { (request, response, json, error) in
                if(error != nil) {
                    NSLog("Error: \(error)")
                    println(request)
                    println(response)
                }
                else {
                    NSLog("Success: \(url)")
                    var json = JSON(json!)
                    //If json is .Dictionary
                    for (key: String, subJson: JSON) in json {
                        
                        var id = subJson["id"].string
                        var naam = subJson["naam"].string
                        var afbeelding = subJson["afbeelding"].string
                        var latitude = subJson["latitude"].string
                        var longitude = subJson["longitude"].string
                        var wachttijd = subJson["wachttijd"].string
                        var waardering = subJson["waardering"].string
                        var attractie = subJson["sprookjesbos"].string
                        var sprookjesbos =  subJson["sprookjesbos"].string
                        var winkel = subJson["winkel"].string
                        var entertainment = subJson["entertainment"].string
                        var algemeen = subJson["algemeen"].string
                        
                        var poi  = POI(id: id!, naam: naam!, afbeelding: afbeelding!, latitude: latitude!, longitude: longitude!, wachttijd: wachttijd!, waardering: waardering!, attractie: attractie!, sprookjesbos: attractie!, winkel: winkel!, entertainment: entertainment!, algemeen: algemeen!)
                        self.POIs.append(poi)
                        
                    }
                    
                    self.POIpicker.dataSource = self
                    self.POIpicker.reloadAllComponents()
                }
        }
        
    }

    
}
