//
//  ViewController.swift
//  WebViewer
//
//  Created by Carlos Poles on 7/05/2016.
//  Copyright © 2016 Carlos Poles. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textURL: UITextField!
    
    @IBOutlet weak var webView: UIWebView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set this viewcontroller as delegate of the textfield.
        textURL.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK - Delegation
    // UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if let urlString = textURL.text {
        
            let url = NSURL(string: urlString)
            let request = NSURLRequest(URL: url!)
            webView.loadRequest(request)
        } else {
            print("Invalid URL")
        }
        textURL.resignFirstResponder()
        return true
        
    }
}

