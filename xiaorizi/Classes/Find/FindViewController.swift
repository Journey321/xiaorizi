//
//  FindViewController.swift
//  xiaorizi
//
//  Created by JohnSon on 16/7/8.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

class FindViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var topSearchView = UIButton()
    var cityBtn: TextImageButton!
    var nameArray = NSMutableArray()
    var imgArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "找店"
        self.view.backgroundColor = BGCOLOR
        nameArray = NSMutableArray.init(array: ["书屋","咖啡馆","餐吧","茶空间","博物馆","工作室","手作坊","更多"])
        imgArray = NSMutableArray.init(array: ["sharewechat","shareweibo","sign","sharefriends","sharewechat","shareweibo","sign","sharefriends"])
        setupNav()
        setUI()
        
    }

    // MARK: 初始化导航栏
    func setupNav(){
        
        cityBtn = TextImageButton(frame: CGRectMake(0, 20, 80, 44))
        cityBtn.setTitle("上海", forState: UIControlState.Normal)
        cityBtn.titleLabel!.font = theme.navItemFont
        cityBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        cityBtn.setImage(UIImage(named: "city_1"), forState: UIControlState.Normal)
        cityBtn.addTarget(self, action: #selector(FindViewController.selectedCityBtnClick), forControlEvents: .TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cityBtn)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.barButtonItemWithRightIcon("near_1", highlightedIcon: "", target: self, action: #selector(FindViewController.nearByBtnClick))
        
    }
    
    
    
    func setUI(){
        
//        头部搜索
        topSearchView = UIButton.init(type: UIButtonType.Custom)
        topSearchView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(topSearchView)
        
        let topSize = CGSizeMake(kScreenWidth, 50)
        topSearchView.autoSetDimensionsToSize(topSize)
        topSearchView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        topSearchView.autoPinEdgeToSuperviewEdge(.Top, withInset: 64)
        topSearchView.addTarget(self, action: #selector(topBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        

        let tableView = UITableView.init()
        self.view.addSubview(tableView)
        tableView.backgroundColor = BGCOLOR
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let tableViewSize = CGSizeMake(kScreenWidth, kScreenHeight - 64 - 2 - 49 - 52)
        tableView.autoSetDimensionsToSize(tableViewSize)
        tableView.autoPinEdge(.Top, toEdge: .Bottom, ofView: topSearchView, withOffset: 2)
        tableView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)

        
    }
    
    
    // MARK: delegate and datasource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        }
        return 1;
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 3;
    }
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 160

        }
        return 50
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = "11"
        cell.backgroundColor = UIColor.grayColor()
        return cell
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            
            
            let view = UIView.init()
            view.backgroundColor = BGCOLOR
            
            let btnWidth:CGFloat = (kScreenWidth)/4.0
            let btnHeight:CGFloat = 74.5;
            let interval:CGFloat = 0

            for i in 0 ... nameArray.count - 1 {
                
                let XX:CGFloat = CGFloat(i%4)
                let YY:CGFloat = CGFloat(i/4)
                let x = XX * (interval + btnWidth)
                let y = YY * (interval + btnHeight);
                let iconName = nameArray.objectAtIndex(i)
                
                let btn = FindCategoryBtn.init()
                btn.nameLable.text = iconName as? String
                btn.iconImg.image = UIImage.init(named: imgArray.objectAtIndex(i) as! String)
                btn.frame = CGRectMake(x, y, btnWidth, btnHeight)
                view.addSubview(btn)
            }
            
            tableView.tableHeaderView = view;

            return view
        }
        
        
        let headerView = UIView.init()
        headerView.backgroundColor = UIColor.whiteColor()
        
        let titleLable = UILabel.init()
        headerView.addSubview(titleLable)
        titleLable.text = section == 1 ? "商圈" : "专题"
        titleLable.font = UIFont.systemFontOfSize(18)
        
        let lableSize = CGSizeMake(100, 15)
        titleLable.autoSetDimensionsToSize(lableSize)
        titleLable.autoPinEdgeToSuperviewEdge(.Left, withInset: 5)
        titleLable.autoPinEdgeToSuperviewEdge(.Top, withInset: 15)
        
        let lineView = UIView.init()
        headerView.addSubview(lineView)
        lineView.backgroundColor = UIColor.blackColor()
        
        let lineSize = CGSizeMake(17, 2)
        lineView.autoSetDimensionsToSize(lineSize)
        lineView.autoPinEdge(.Top, toEdge: .Bottom, ofView: titleLable, withOffset: 5)
        lineView.autoPinEdgeToSuperviewEdge(.Left, withInset: 5)
        
        if section == 2 {
            
//            g更多
            let moreLable = UILabel.init()
            moreLable.text = "更多"
            headerView.addSubview(moreLable)
            moreLable.font = UIFont.systemFontOfSize(16)
            moreLable.textColor = UIColor.grayColor()
            
            let moreSize = CGSizeMake(35, 15)
            moreLable.autoSetDimensionsToSize(moreSize)
            moreLable.autoPinEdgeToSuperviewEdge(.Top, withInset: 20)
            moreLable.autoPinEdgeToSuperviewEdge(.Left, withInset: kScreenWidth - 60)
            
            
//            箭头
            let arrowImg = UIImageView.init()
            headerView.addSubview(arrowImg)
            arrowImg.image = UIImage.init(named:"into")
            
            let imgSize = CGSizeMake(20, 20)
            arrowImg.autoSetDimensionsToSize(imgSize)
            arrowImg.autoPinEdge(.Left, toEdge: .Right, ofView: moreLable, withOffset: 0)
            arrowImg.autoPinEdgeToSuperviewEdge(.Top, withInset: 17)
            
            
            
            
            
            
        }
        
        return headerView
            
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated:true)
        
        
    }
    
    
    
    // MARK: 头部点击事件
    func topBtnClick(){
        print("----click----")
        UIView.animateWithDuration(13) {
            
//            self.navigationController?.navigationBarHidden = true
//
//            self.topSearchView.autoPinEdgeToSuperviewEdge(.Top, withInset: 20)
        }
        
  
        
    }
    
    
    
    // MARK: 导航栏按钮点击事件
    func selectedCityBtnClick() {
        
    }
    
    func nearByBtnClick() {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
