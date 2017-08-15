//
//  ViewController.swift
//  Menu Bars
//
//  Created by Hien Le on 8/15/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()

    @IBAction func cameraPressed(_ sender: Any) {
        timer.invalidate()
    }
    
    func processTimer(){
        print("A second has passed!")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("processTimer"), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

