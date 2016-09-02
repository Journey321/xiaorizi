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
    var nameArray = NSMutableArray()
    var subTittle = NSMutableArray()
    var placeholderArray = NSMutableArray()
    var navigationTittleArray = NSMutableArray()


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
        tableView.scrollEnabled = false
        let size = CGSizeMake(kScreenWidth, 314)
        tableView.autoSetDimensionsToSize(size)
        tableView.autoPinEdgeToSuperviewEdge(.Top, withInset: 0)
        tableView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        
        tableView.registerClass(MyCenterHeaderCell.self, forCellReuseIdentifier: "cellIdentifier")
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

        nameArray = NSMutableArray.init(array: ["用户名","签名","邮箱","手机号"])
        subTittle = NSMutableArray.init(array: ["豆豆的皮豆","","添加邮箱","绑定手机号"])
        placeholderArray = NSMutableArray.init(array: ["请输入您的昵称","请输入您的签名","请输入您的邮箱","请输入手机号"])
        navigationTittleArray = NSMutableArray.init(array: ["用户名","签名","邮箱","手机号"])

    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        
        if indexPath.row == 0 {
            let cell = MyCenterHeaderCell.init(style: UITableViewCellStyle.Value1, reuseIdentifier: "cellIdentifier")
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell.selectionStyle = UITableViewCellSelectionStyle.None;
            return cell;

        }
        
        let cell = UITableViewCell.init(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell")
        cell.textLabel?.text = nameArray.objectAtIndex(indexPath.row - 1) as? String
        cell.detailTextLabel?.text = subTittle.objectAtIndex(indexPath.row - 1) as? String
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.selectionStyle = UITableViewCellSelectionStyle.None;

        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row > 0 {
            let vc = ChangeNameViewController()
            vc.navigationTittle = navigationTittleArray.objectAtIndex(indexPath.row - 1) as! String
            vc.placeholderStr = placeholderArray.objectAtIndex(indexPath.row - 1) as! String
            self.navigationController?.pushViewController(vc, animated: true)
        }
   
        
    }

}













