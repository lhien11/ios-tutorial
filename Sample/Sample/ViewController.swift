//
//  ViewController.swift
//  Sample
//
//  Created by Hien Le on 9/11/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sampleText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sampleText.text = "Hello Someone"
        
        
    }

    @IBOutlet var Annie: UIButton!
    @IBOutlet var Hien: UIButton!
    @IBAction func changeText(_ sender: Any) {
        sampleText.text = "Hi " + Annie.currentTitle!
    }
    @IBAction func changeHien(_ sender: Any) {
        sampleText.text = "Hello " + Hien.currentTitle!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

