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
        
        if !checkEmptynessFor(textURL) {
            let validation = validateURLByString(textURL.text)
            if validation {
                let url = NSURL(string: textURL.text!)
                let request = NSURLRequest(URL: url!)
                webView.loadRequest(request)
            } else {
                let alert = UIAlertController.init(title: "Invalid URL", message: "Enter a valid URL.", preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
        
            textURL.resignFirstResponder()
        return true
        
    }
    
    // MARK - Methods
    
    func checkEmptynessFor(textField: UITextField) -> Bool {
        
        if let text = textField.text {
            if text.isEmpty {
                let alert = UIAlertController.init(title: "URL Field Empty", message: "Please Enter a URL.", preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
                return true
            }
        }
        return false
    }
    
    func validateURLByString(string: String?) -> Bool {
        
        if let urlString = string {
            if let url = NSURL(string: urlString) {
                return UIApplication.sharedApplication().canOpenURL(url)
            }
        }
        return false
    }
}

