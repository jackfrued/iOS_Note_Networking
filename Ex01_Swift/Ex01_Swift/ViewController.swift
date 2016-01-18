//
//  ViewController.swift
//  Ex01_Swift
//
//  Created by LUOHao on 16/1/9.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, 320, 160))
        imageView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2)
        self.view.addSubview(imageView)
        
        guard let url = NSURL(string: "http://www.baidu.com/img/bd_logo1.png") else { return }
        guard let data = NSData(contentsOfURL: url) else  { return }
        imageView.image = UIImage(data: data)
    }

}
