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
    
    var time = 210
    
    func decreaseTimer(){
        if time > 0 {
            
            time -= 1
            
            timerLabel.text = String(time)
            
        } else {
            
            timer.invalidate()
            
        }
        
        
    }
    

    @IBOutlet var timerLabel: UILabel!

    
    @IBAction func play(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func plusTen(_ sender: Any) {
            time += 10
            timerLabel.text = String(time)
        
    }
    
    @IBAction func minusTen(_ sender: Any) {
        if time > 0 {
            time -= 10
            timerLabel.text = String(time)
        } else {
            timer.invalidate()
        }
    }
    @IBAction func resetTimer(_ sender: Any) {
        time = 210
        timerLabel.text = String(time)
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

