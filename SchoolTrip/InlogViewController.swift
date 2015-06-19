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
    
    func getPOI() {
        var url = Constants.getIpAdress() + Constants.getPOIUrl()
        var pointOfInterest : [POI] = []
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
                        pointOfInterest.append(poi)
                    }
                }
        }

    }
    

    
}