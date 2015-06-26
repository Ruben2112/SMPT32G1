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
    @IBOutlet weak var timePicker: UIDatePicker!
    var POIs : [POI] = []
    var date : NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Afspraak maken controller")
        getPOI()
        timePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
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

    func datePickerChanged(datePicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        date = datePicker.date
    }
    
    @IBAction func btnSave(sender: AnyObject) {
        var c = Constants.getGroepsCode()
        var id = ""
        for x in Constants.groepen {
            if(x.lidcode == c || x.beheercode == c){
                id = x.id
            }
        }
        var selectedPOI = POIs[POIpicker.selectedRowInComponent(Int())]

        let calendar = NSCalendar.currentCalendar()
        let comp = calendar.components((.CalendarUnitHour | .CalendarUnitMinute), fromDate: date!)
        
        let time = (String(comp.hour) + ":" + String(comp.minute))
        println("Groepid = " + id)
        println("POI = " + selectedPOI.naam)
        println("Tijdstip = " + time)
        
        var url = (Constants.urlNewAfspraak + "?groepsid=" + id + "&POIid=" + selectedPOI.id + "&tijdstip=" + time + "&aanwezig=0")
        println(url)
        
        request(.GET, url, parameters: nil)
            .responseJSON { (request, response, json, error) in
                if(error != nil) {
                    NSLog("Error: \(error)")
                }
                else {
                    NSLog("Success: \(url)")
                    println("Afspraak succesvol toegevoegd")
                }
        }

        
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
