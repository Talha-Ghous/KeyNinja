//
//  Customers.swift
//  KeyNinja
//
//  Created by Talha Ghous on 24/4/19.
//  Copyright © 2019 Talha Ghous. All rights reserved.
//

import UIKit

class Customers: NSObject ,NSCoding{
    var firstName = ""
    var lastName = ""
    var emailAddress = ""
    
    func setCustomer(first:String , last:String , email:String) {
        self.firstName = first
        self.lastName = last
        self.emailAddress = email
    }
    init(first:String , last:String , email:String) {
        self.firstName = first
        self.lastName = last
        self.emailAddress = email
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let fName = aDecoder.decodeObject(forKey: "firstName") as! String
        let Lname = aDecoder.decodeObject(forKey: "lastName") as! String
        let eAddress = aDecoder.decodeObject(forKey: "emailAddress") as! String
        self.init(first: fName, last: Lname, email: eAddress)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(firstName, forKey: "firstName")
        aCoder.encode(lastName, forKey: "lastName")
        aCoder.encode(emailAddress, forKey: "emailAddress")
    }
}
