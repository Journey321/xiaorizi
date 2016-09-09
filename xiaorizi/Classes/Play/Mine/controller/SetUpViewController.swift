//
//  SetUpViewController.swift
//  xiaorizi
//
//  Created by zhike on 16/9/8.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

class SetUpViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var nameArray = NSMutableArray()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        self.title = "设置"
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        let tableView = UITableView.init()
        self.view.addSubview(tableView)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = UIView.init()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.scrollEnabled = false
        
        let size = CGSizeMake(kScreenWidth, 200 + 64)
        tableView.autoSetDimensionsToSize(size)
        tableView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        tableView.autoPinEdgeToSuperviewEdge(.Top, withInset: 0)
        
        
        nameArray = NSMutableArray.init(array: ["意见反馈","关于我们","去AppStore评价小日子","清除缓存"])
        
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell")
        cell.textLabel?.text = nameArray.objectAtIndex(indexPath.row) as! NSString as String
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.selectionStyle = UITableViewCellSelectionStyle.None;
        return cell
    
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vc = FeedbackViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
