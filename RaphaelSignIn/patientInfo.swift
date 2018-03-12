//
//  patientInfo.swift
//  RaphaelSignIn
//
//  Created by Suzie Su Jin Ahn on 3/9/18.
//  Copyright © 2018 Raphael Wellness Center. All rights reserved.
//

import Foundation

struct patientInfo{
    var name: String?
    var birthday: String?
    var gender: String?
    var address: String?
    var city: String?
    var state: String?
    var phone: String?
    
    
    init(){
       
        self.name = nil
        self.birthday = nil
        self.gender = nil
        self.address = nil
        self.city = nil
        self.state = nil
        self.phone = nil
        
    }
}
