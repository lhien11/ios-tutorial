//
//  FirstViewController.swift
//  To Do List
//
//  Created by Hien Le on 8/16/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var items: [String] = []

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell 
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
        
        }
        
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            items.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

