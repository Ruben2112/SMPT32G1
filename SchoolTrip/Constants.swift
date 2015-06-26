//
//  Constants.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 19-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation

class Constants{
    static var IPAdress = "http://77.174.176.114"
    
    static var urlAfspraak = "/selectAFSPRAAK.php"
    static var urlPOI = "/selectPOI.php"
    static var urlLid = "/selectLID.php"
    static var urlAfbeelding = "/selectAFBEELDING.php"
    static var urlGroep = "/selectGROEP.php"
    
    // Voorbeeld: http://77.174.176.114/insertAFSPRAAK.php?groepsid=7&POIid=12&tijdstip=11:15&aanwezig=1
    static var urlNewAfspraak = "http://77.174.176.114/insertAFSPRAAK.php"
    static var leden = [LID]()
    
    static var groepen = [GROEP]()
    
    static var groepsCode = ""
    static var afspraken = [AFSPRAAK]()
    
    static func getLeden() -> [LID]{
        
        var c = self.getGroepsCode()
        var id = ""
        for x in groepen {
            if(x.lidcode == c || x.beheercode == c){
                id = x.id
            }
        }
        
        var result = [LID]()
        
        for x in leden{
            if(x.groepId == id  ){
                result.append(x)
            }
        }
        
        return result
    }
    
    static func setLeden(lid : LID){
        leden.append(lid)
    }
    
    static func getGroepen() -> [GROEP]{
        return getGroepenJSON()
    }
    
    static func setGroep(groep : GROEP){
        self.groepen.append(groep)
    }
    
    static func getGroepsCode() -> String {
        return self.groepsCode
    }
    
    static func setGroepsCode(code : String){
        if(!code.isEmpty){
            self.groepsCode = code
        }
    }
    
    static func getAfspraken() -> [AFSPRAAK]{
        
        var c = self.getGroepsCode()
        var id = ""
        for x in groepen {
            if(x.lidcode == c || x.beheercode == c){
                id = x.id
            }
        }
        
        var result = [AFSPRAAK]()
        
        for x in afspraken{
            if(x.groepsId == id  ){
                result.append(x)
            }
        }
        
        return result
    }
    
    static func setAfspraak(a : AFSPRAAK){
        self.afspraken.append(a)
    }
    
    static func getIpAdress() -> String{
        return self.IPAdress
    }
    
    static func getAfspraakUrl() -> String {
        return self.urlAfspraak
    }
    
    static func getPOIUrl() -> String {
        return self.urlPOI
    }
    
    static func getLidUrl() -> String {
        return self.urlLid
    }
    
    static func getAfbeeldingUrl() -> String {
        return self.urlAfbeelding
    }
    
    static func getGroepUrl() -> String {
        return self.urlGroep
    }
    
    static func checkGroup(code:String , naam : String) -> String{
        
        return "/checkGroup.php?code=\(code)&naam=\(naam)"
    }
    
    
    static func getGroepenJSON() -> [GROEP]{
        
        var url = Constants.getIpAdress() + Constants.getGroepUrl()
        var groeps : [GROEP] = []
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
                        var datum = subJson["datum"].string
                        var lidcode = subJson["lidcode"].string
                        var beheerderscode = subJson["beheerderscode"].string
                        
                        var groep = GROEP(id: id!, datum: datum!, lidcode: lidcode!, beheercode: beheerderscode!)
                        groeps.append(groep)
                        Constants.setGroep(groep)
                    }
                }
        }
        return groeps
    }
    
    static func getLedenJSON(){
        
        var url = Constants.getIpAdress() + Constants.getLidUrl()
        var leden : [LID] = []
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
                        var groupid = subJson["groepid"].string
                        var beheerder = subJson["beheerder"].string
                        var lon = subJson["longitude"].string
                        var lat = subJson["latitude"].string
                        var lid = LID(id: id!, naam: naam!, groepId: groupid!, beheerder: beheerder!, lat: lat!, lon: lon!)                        
                        Constants.setLeden(lid)
                        println(lid.naam)
                    }
                }
        }
    
    }
    
}