//
//  DoItListViewController.swift
//  DoIt
//
//  Created by Jakub Minkiewicz on 10/03/2019.
//  Copyright © 2019 Jakub Minkiewicz. All rights reserved.
//

import UIKit

class DoItListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find egg"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "Find egg1"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Find egg2"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Find egg3"
        itemArray.append(newItem3)
        
        
        
//        if let items = defaults.array(forKey: "DoItListArray") as? [String] {
//            itemArray = items
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoItItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK -- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done.toggle()
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once user clicks the Add Item button
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "DoItListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
}
