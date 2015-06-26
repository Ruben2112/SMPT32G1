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
    
    static var groepen = [GROEP]()
    
    static var groepsCode = ""
    static var afspraken = [AFSPRAAK]()
    
    static func getGroepen() -> [GROEP]{
        return self.groepen
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
    
    
}