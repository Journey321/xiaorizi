//
//  SpecialTableViewController.swift
//  xiaorizi
//
//  Created by zhike on 16/9/19.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

class SpecialTableViewController: UITableViewController {

    // 顶部刷新
    let header = MJRefreshNormalHeader()
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.hidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = BGCOLOR
        self.title = "专题"
        self.tableView.registerClass(FindCustomTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, -49, 0)
        
        //下拉刷新
        self.tableView.mj_header = header
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        
        
        //底部刷新
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        self.tableView.mj_footer = footer
        
    }


    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 5
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 204;
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : FindCustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")as! FindCustomTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.isTheme = true
        return cell
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    
    // MARK: 下拉刷新
    func headerRefresh(){
        
        let time: NSTimeInterval = 2.0
        let delay = dispatch_time(DISPATCH_TIME_NOW,
                                  Int64(time * Double(NSEC_PER_SEC)))
        dispatch_after(delay, dispatch_get_main_queue()) {
            print("2 秒后输出")
            self.tableView.mj_header.endRefreshing()
        }
    }
    
    
    var index = 0
    func footerRefresh(){
        
        self.tableView.mj_footer.endRefreshing()
        
        index = index + 1
        if index > 2 {
            
            self.tableView.mj_footer.endRefreshingWithNoMoreData()
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
