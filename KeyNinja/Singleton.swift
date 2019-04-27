//
//  Singleton.swift
//  KeyNinja
//
//  Created by Talha Ghous on 25/4/19.
//  Copyright © 2019 Talha Ghous. All rights reserved.
//

import UIKit

class Singleton: NSObject {
   static let sharedInstance = Singleton()
    
    func getCustomerList() -> Array<Customers> {
        let preferences = UserDefaults.standard
        if preferences.data(forKey: "CUSTOMERS") == nil {
            return Array()
        }else{
            let decoded  = preferences.data(forKey: "CUSTOMERS")
            let decodedCustomerList = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! [Customers]
            return decodedCustomerList
        }
    }
    
    
    func writeToDisk(customer:Customers)  {
        let preferences = UserDefaults.standard
        
        var customersList = self.getCustomerList()
        customersList.append(customer)
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: customersList)
        preferences.set(encodedData , forKey: "CUSTOMERS")
        
        
        preferences.synchronize()
    }
}
