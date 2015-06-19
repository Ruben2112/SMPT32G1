//
//  POI.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 19-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation

class POI {
    
    var id : String
    var naam : String
    var afbeelding : String
    var latitude : String
    var longitude : String
    var wachttijd : String
    var waardering : String
    var attractie : String
    var sprookjesbos : String
    var winkel : String
    var entertainment : String
    var algemeen : String
    
    
    init( id:String, naam:String, afbeelding:String, latitude:String, longitude:String, wachttijd:String, waardering:String, attractie:String, sprookjesbos:String, winkel:String, entertainment:String,algemeen:String ){
        
        self.id = id
        self.naam = naam
        self.afbeelding = afbeelding
        self.latitude = latitude
        self.longitude = longitude
        self.wachttijd = wachttijd
        self.waardering = waardering
        self.attractie = attractie
        self.sprookjesbos = sprookjesbos
        self.winkel = winkel
        self.entertainment = entertainment
        self.algemeen = algemeen
        
    }
    
    
    
    
}