//
//  ViewController.swift
//  miniBrowser
//
//  Created by Yoo SeungHwan on 2016/09/24.
//  Copyright © 2016年 kotsuya00. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    @IBOutlet var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet var urlTextField: UITextField!
    @IBOutlet var mainWebView: UIWebView!
    @IBOutlet var spinningActivityIndicator: UIActivityIndicatorView!
    
    @IBAction func bookMarkAction(_ sender: AnyObject) {
        let bookMarkUrl = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)
        let urlString = "https://www.\(bookMarkUrl! ).com"
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = "\(urlTextField.text!)"
        
        if !urlString.hasPrefix("https") {
            urlString = "https://\(urlTextField.text!)"
        }
        
        mainWebView.loadRequest(URLRequest(url: URL(string:urlString)!))
        urlTextField.text = urlString

        urlTextField.resignFirstResponder()
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        spinningActivityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        spinningActivityIndicator.stopAnimating()
    }
    
    /*
    @IBAction func backAction(_ sender: AnyObject) {
        mainWebView.goBack()
    }
    
    @IBAction func forwardAction(_ sender: AnyObject) {
        mainWebView.goForward()
    }
    
    @IBAction func stopAction(_ sender: AnyObject) {
        mainWebView.stopLoading()
    }
    
    @IBAction func refreshAction(_ sender: AnyObject) {
        mainWebView.reload()
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //urlTextField.delegate = self
        
        let urlString = "https://www.facebook.com"
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

