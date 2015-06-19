//
//  Constants.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 19-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation

class Constants{
    static var IPAdress = "77.174.176.114"
    
    static var urlAfspraak = "/selectAFSRPAAK.php"
    static var urlPOI = "/selectPOI.php"
    static var urlLid = "/selectLID.php"
    static var urlAfbeelding = "/selectAFBEELDING.php"
    static var urlGroep = "/selectGROEP.php"
    
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
    
    
    
}