//
//  AFBEELDING.swift
//  SchoolTrip
//
//  Created by Sjors van Mierlo on 26-06-15.
//  Copyright (c) 2015 fhict. All rights reserved.
//

import Foundation

class AFBEELDING
{
    var id : String
    var lidId : String
    var datum : String
    var url : String
    var verwijderd : String
    
    init(id:String, lidId:String, datum:String,url:String, verwijderd:String){
        self.id = id
        self.lidId = lidId
        self.datum = datum
        self.url = url
        self.verwijderd = verwijderd
    }
}