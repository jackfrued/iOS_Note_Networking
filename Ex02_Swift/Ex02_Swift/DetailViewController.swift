//
//  DetailViewController.swift
//  Ex02_Swift
//
//  Created by LUOHao on 16/1/9.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var urlStr: String = ""
    var myWebView: UIWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView = UIWebView(frame: self.view.bounds)
        myWebView!.scalesPageToFit = true
        self.view.addSubview(myWebView!)
        guard let url = NSURL(string: urlStr) else { return }
        let request = NSURLRequest(URL: url)
        myWebView!.loadRequest(request)
    }
}
