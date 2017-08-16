//
//  ViewController.swift
//  Permanent Data Storage
//
//  Created by Hien Le on 8/16/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textNumber: UILabel!
    
    @IBOutlet var phoneNumber: UITextField!
    
    @IBAction func save(_ sender: Any) {
        UserDefaults.standard.set(phoneNumber.text, forKey: "number")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let numberObject = UserDefaults.standard.object(forKey: "number")
        
        if let number = numberObject as? String {
            phoneNumber.text = number 
        }
        //UserDefaults.standard().set("Rob", forKey: "name")
        
//        UserDefaults.standard.set("Hien", forKey: "name")
//        
//        let nameObject = UserDefaults.standard.object(forKey: "name")
//        
//        if let name = nameObject as? String {
//            
//            print(name)
//            
//        }
//        print("viewDidLoad")
        
//        let arr = [1, 2, 3, 4]
//        
//        UserDefaults.standard.set(arr, forKey: "array")
//        
//        let arrayObject = UserDefaults.standard.object(forKey: "array")
//        
//        if let array = arrayObject as? NSArray {
//
//            print(array)
//            
//        }

    

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

