//
//  addCustomerViewController.swift
//  KeyNinja
//
//  Created by Talha Ghous on 24/4/19.
//  Copyright © 2019 Talha Ghous. All rights reserved.
//

import UIKit

class addCustomerViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    var localCustomer : Customers?
    var isEditAble = false
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Customer"
        if isEditAble {
            self.title = "Edit Customer"
            self.firstNameTextField.text = self.localCustomer?.firstName
            self.lastNameTextField.text = self.localCustomer?.lastName
            self.emailAddressTextField.text = self.localCustomer?.emailAddress
        }
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveClicked(_ sender: UIButton) {
        var customer : Customers!
       
        if !(self.firstNameTextField.text?.isEmpty)! && !(self.lastNameTextField.text?.isEmpty)! && !(self.emailAddressTextField.text?.isEmpty)! {

        customer = Customers(first: self.firstNameTextField.text!, last: self.lastNameTextField.text!, email: self.emailAddressTextField.text!)

        if isEditAble {
            let preferences = UserDefaults.standard
            var customersList = Singleton.sharedInstance.getCustomerList()
            customersList[self.index] = customer
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: customersList)
            preferences.set(encodedData , forKey: "CUSTOMERS")
            preferences.synchronize()
        }
        Singleton.sharedInstance.writeToDisk(customer: customer)
        }else{
            showAlertView(Title: "Try Again", Message: "Please provide complete details")
        }
        self.navigationController?.popViewController(animated: true)
    }
    

    func showAlertView(Title title:String, Message message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        
        self.present(alert, animated: true, completion: nil)
    }

}
