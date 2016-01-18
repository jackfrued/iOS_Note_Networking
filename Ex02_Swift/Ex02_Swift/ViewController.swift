//
//  ViewController.swift
//  Ex02_Swift
//
//  Created by LUOHao on 16/1/9.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var myTableView: UITableView?
    var dataArray = [RelativeNews]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "相关新闻链接"
        
        myTableView = UITableView(frame: self.view.bounds, style: .Plain)
        myTableView!.dataSource = self
        myTableView!.delegate = self
        self.view.addSubview(myTableView!)
        
        self.loadDataModel()
    }
    
    func loadDataModel() {
        guard let url = NSURL(string: "http://www.oschina.net/action/api/news_detail?id=44393") else { return }
        guard let data = NSData(contentsOfURL: url) else { return }
        do {
            for node in try DDXMLDocument(data: data, options: 0).nodesForXPath("//relative") {
                if let relative = node as? DDXMLNode {
                    if let children = relative.children() as? [DDXMLNode] {
                        let model = RelativeNews()
                        model.title = children[0].stringValue()
                        model.url = children[1].stringValue()
                        dataArray.append(model)
                    }
                }
            }
            myTableView!.reloadData()
        }
        catch  {
            print("Error occured while handling XML")
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "CELL")
        }
        let model = dataArray[indexPath.row]
        cell?.textLabel?.text = model.title
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let model = dataArray[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.urlStr = model.url
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

