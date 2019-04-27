//
//  TableViewController.swift
//  KeyNinja
//
//  Created by Talha Ghous on 23/4/19.
//  Copyright © 2019 Talha Ghous. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var customersList : Array<Customers>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Customers"
        self.customersList = Singleton.sharedInstance.getCustomerList()
        
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusClicked))
         self.navigationItem.rightBarButtonItem = addBarButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.customersList = Singleton.sharedInstance.getCustomerList()
        self.tableView.reloadData()
    }
    @objc func plusClicked()  {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "addCustomerViewController") as! addCustomerViewController
        myVC.isEditAble = false
        self.navigationController!.pushViewController(myVC, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       return self.customersList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let customer = self.customersList![indexPath.row]
        cell.firstName.text  = "First Name = "+customer.firstName//"Talha"
        cell.lastName.text = "Last Name = "+customer.lastName//"Ghous"
        cell.emailAddress.text = "Email Address = "+customer.emailAddress//"talhaghous125@gmail.com"
        

        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "addCustomerViewController") as! addCustomerViewController
        myVC.isEditAble = true
        myVC.index = indexPath.row
        myVC.localCustomer = self.customersList![indexPath.row]

        
        self.navigationController!.pushViewController(myVC, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
