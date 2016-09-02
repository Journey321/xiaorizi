//
//  MyCenterViewController.swift
//  xiaorizi
//
//  Created by zhike on 16/9/2.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

class MyCenterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView = UITableView()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.hidden = true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "个人中心"
        self.view.backgroundColor = UIColor.orangeColor()
        
        tableView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(tableView)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = UIView.init()
        tableView.frame = CGRectMake(0, 64, kScreenWidth, 250)
//        let size = CGSizeMake(kScreenWidth, 250)
//        tableView.autoSetDimensionsToSize(size)
//        tableView.autoPinEdgeToSuperviewEdge(.Top, withInset: 0)
//        tableView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")

    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView .dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = "11"
        return cell;
    }
    
    

}













