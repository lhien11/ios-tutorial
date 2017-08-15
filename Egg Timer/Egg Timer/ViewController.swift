//
//  ViewController.swift
//  Egg Timer
//
//  Created by Hien Le on 8/15/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    
    

    @IBOutlet var timerLabel: UILabel!
    
    @IBAction func play(_ sender: Any) {
    }
    
    @IBAction func pause(_ sender: Any) {
    }
    @IBAction func plusTen(_ sender: Any) {
    }
    
    @IBAction func minusTen(_ sender: Any) {
    }
    @IBAction func resetTimer(_ sender: Any) {
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

