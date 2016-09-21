//
//  SearchViewController.swift
//  xiaorizi
//
//  Created by zhike on 16/9/20.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    var topView = UIView()
    var textField = UITextField()
    // 顶部刷新
    var header = MJRefreshNormalHeader()
    // 底部刷新
    var footer = MJRefreshAutoNormalFooter()
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        setUI()
        
        
    }
    
    
    func setUI(){
        
        // 顶部背景view
        topView = UIView.init()
        topView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(topView)
        
        let topSize = CGSizeMake(kScreenWidth, 50)
        topView.autoSetDimensionsToSize(topSize)
        topView.autoPinEdgeToSuperviewEdge(.Top, withInset: 20)
        topView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        
        
        //搜索背景
        let searchView = UIImageView.init()
        topView.addSubview(searchView)
        searchView.image = UIImage.init(named: "searchdi")
        searchView.userInteractionEnabled = true
        
        let searchSize = CGSizeMake(kScreenWidth - 75 , 30)
        searchView.autoSetDimensionsToSize(searchSize)
        searchView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        searchView.autoPinEdgeToSuperviewEdge(.Top, withInset: 10)
        
        
        //搜索图标
        let iconImg = UIImageView.init()
        iconImg.image = UIImage.init(named: "zdsearch")
        searchView.addSubview(iconImg)
        
        let iconSize = CGSizeMake(20, 20)
        iconImg.autoSetDimensionsToSize(iconSize)
        iconImg.autoPinEdgeToSuperviewEdge(.Top, withInset: 5)
        iconImg.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        
        
        //textField 
        textField = UITextField.init()
        textField.placeholder = "店名，地址"
        textField.font = UIFont.systemFontOfSize(14)
        textField.returnKeyType = UIReturnKeyType.Search
        textField.becomeFirstResponder()
        textField.delegate = self
        searchView.addSubview(textField)
        textField.clearButtonMode = UITextFieldViewMode.Always
        
        let textSize = CGSizeMake(kScreenWidth - 75 - 10 - 20 - 5 , 30)
        textField.autoSetDimensionsToSize(textSize)
        textField.autoPinEdge(.Left, toEdge: .Right, ofView:iconImg , withOffset: 5)
        textField.autoPinEdgeToSuperviewEdge(.Top, withInset: 0)
        

        //取消按钮
        let cancelBtn = UIButton.init(type: UIButtonType.Custom)
        cancelBtn.setTitle("取消", forState: UIControlState.Normal)
        cancelBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        cancelBtn.titleLabel?.font = UIFont.systemFontOfSize(16)
        topView.addSubview(cancelBtn)
        cancelBtn.addTarget(self, action: #selector(cancelBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        
        let btnSize = CGSizeMake(40, 30)
        cancelBtn.autoSetDimensionsToSize(btnSize)
        cancelBtn.autoPinEdgeToSuperviewEdge(.Right, withInset: 13)
        cancelBtn.autoPinEdgeToSuperviewEdge(.Top, withInset: 10)
 
    
        //tableView
        tableView = UITableView.init()
        tableView.backgroundColor = BGCOLOR
        tableView.tableFooterView = UIView.init()
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let tableViewSize = CGSizeMake(kScreenWidth, kScreenHeight - 70)
        tableView.autoSetDimensionsToSize(tableViewSize)
        tableView.autoPinEdge(.Top, toEdge: .Bottom, ofView: topView)
        tableView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        
        //下拉刷新
        self.tableView.mj_header = header
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        
        //底部刷新
//        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
//        self.tableView.mj_footer = footer
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.textLabel?.text = "11"
        
        return cell
    }


    // MARK: 取消按钮
    func cancelBtnClick(){
        
        textField.resignFirstResponder()
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    // MARK: 搜索
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
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
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
