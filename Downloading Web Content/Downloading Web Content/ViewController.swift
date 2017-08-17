//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Hien Le on 8/16/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let url = URL(string: "https://www.stackoverflow.com")!
        
//        webview.loadRequest(URLRequest(url: url))
        
//        webview.loadHTMLString("<h1>Hello there!</h1>", baseURL: nil)
        
        if let url = URL(string: "https://www.stackoverflow.com"){
        
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print(error!)
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        print(dataString!)
                        DispatchQueue.main.sync(execute:  {
                            // Update UI
                        })
                    }
                }
            }
            task.resume()
        }
        
        print("Hi There");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

