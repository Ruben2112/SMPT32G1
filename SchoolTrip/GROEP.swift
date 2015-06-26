//
//  GROEP.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 25-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation

class GROEP {
    var id : String
    var datum : String
    var lidcode : String
    var beheercode :String
    
    init(id : String, datum : String, lidcode : String, beheercode :String){
        self.id = id
        self.datum = datum
        self.lidcode = lidcode
        self.beheercode = beheercode
    }
}

