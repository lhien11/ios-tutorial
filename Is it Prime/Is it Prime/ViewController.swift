//
//  ViewController.swift
//  Is it Prime
//
//  Created by Hien Le on 8/14/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numberTextField: UITextField!
    
    @IBAction func isItPrime(_ sender: Any) {
        // optional binding
        if let userEnteredString =  numberTextField.text {
            // casting it to int
            let userEnteredInteger = Int(userEnteredString)
            
            if let number = userEnteredInteger {
                var isPrime = true
                
                
                if number == 1 {
                    isPrime = false
                } else if (number < 1){
                    resultLabel.text = "Please enter a positive whole number"
                    return
                }
                var i = 2
                while i < number {
                    if number % i == 0 {
                        isPrime = false
                    }
                    i += 1
                }
                
                if isPrime {
                    resultLabel.text = "\(number) is prime!"
                }else {
                    resultLabel.text = "\(number) is not prime"
                }
                
            }
            else {
                resultLabel.text = "Please enter a positive whole number"
            }
        }
        
    }
    @IBOutlet var resultLabel: UILabel!
    
    // This is a comment
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

