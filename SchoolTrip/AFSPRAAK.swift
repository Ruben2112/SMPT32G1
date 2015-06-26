//
//  AFSPRAAK.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 26-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation

class AFSPRAAK {
    var id : String
    var groepsId : String
    var POIid : String
    var tijdstip : String
    var aanwezigheidsstatus : String
    
    init(id : String, groepsId : String, POIid:String, tijdstip :String, aanwezigheidsstatus:String){
        self.id = id
        self.groepsId = groepsId
        self.POIid = POIid
        self.tijdstip = tijdstip
        self.aanwezigheidsstatus = aanwezigheidsstatus        
    }
}