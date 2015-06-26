//
//  LID.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 26-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation

class LID {
    var id : String
    var naam : String
    var groepId : String
    var beheerder : String
    var lat : String
    var lon : String
    
    init(id : String, naam : String, groepId : String, beheerder : String, lat : String, lon : String){
        self.id = id
        self.naam = naam
        self.groepId = groepId
        self.beheerder = beheerder
        self.lat = lat
        self.lon = lon
    }
    
}