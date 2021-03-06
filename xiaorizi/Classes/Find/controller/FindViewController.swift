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
    var tableView = UITableView()
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.hidden = false
        
    }

    
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
        

        tableView = UITableView.init()
        self.view.addSubview(tableView)
        tableView.backgroundColor = BGCOLOR
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init()
        tableView.registerClass(FindCustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        let tableViewSize = CGSizeMake(kScreenWidth, kScreenHeight - 64 - 2 - 49 - 52)
        tableView.autoSetDimensionsToSize(tableViewSize)
        tableView.autoPinEdge(.Top, toEdge: .Bottom, ofView: topSearchView, withOffset: 2)
        tableView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)

        //下拉刷新
        self.tableView.mj_header = header
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))

        
        //底部刷新
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        self.tableView.mj_footer = footer
        
        
    }
    
    
    // MARK: delegate and datasource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        }
        return 3;
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
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 1 {
            
            return 145
        }
        return 204
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = FindCustomTableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        if indexPath.section == 2 {
            cell.isTheme = true
        }
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
            
//            tableView.tableHeaderView = view;

            return view
        }
        
        
        let headerView = UIView.init()
        headerView.backgroundColor = UIColor.whiteColor()
        
        //标题
        let titleLable = UILabel.init()
        headerView.addSubview(titleLable)
        titleLable.text = section == 1 ? "商圈" : "专题"
        titleLable.font = UIFont.systemFontOfSize(18)
        
        let lableSize = CGSizeMake(100, 15)
        titleLable.autoSetDimensionsToSize(lableSize)
        titleLable.autoPinEdgeToSuperviewEdge(.Left, withInset: 5)
        titleLable.autoPinEdgeToSuperviewEdge(.Top, withInset: 15)
        
        
        //分割线
        let lineView = UIView.init()
        headerView.addSubview(lineView)
        lineView.backgroundColor = UIColor.blackColor()
        
        let lineSize = CGSizeMake(17, 2)
        lineView.autoSetDimensionsToSize(lineSize)
        lineView.autoPinEdge(.Top, toEdge: .Bottom, ofView: titleLable, withOffset: 5)
        lineView.autoPinEdgeToSuperviewEdge(.Left, withInset: 5)
        
        if section == 2 {
            
//           更多
            let moreLable = UILabel.init()
            moreLable.text = "更多"
            headerView.addSubview(moreLable)
            moreLable.font = UIFont.systemFontOfSize(14)
            moreLable.textColor = UIColor.grayColor()
            moreLable.textAlignment = NSTextAlignment.Right
            
            let moreSize = CGSizeMake(30, 15)
            moreLable.autoSetDimensionsToSize(moreSize)
            moreLable.autoPinEdgeToSuperviewEdge(.Top, withInset: 20)
            moreLable.autoPinEdgeToSuperviewEdge(.Left, withInset: kScreenWidth - 50)
            
            
//            箭头
            let arrowImg = UIImageView.init()
            headerView.addSubview(arrowImg)
            arrowImg.image = UIImage.init(named:"into")

            let imgSize = CGSizeMake(17, 20)
            arrowImg.autoSetDimensionsToSize(imgSize)
            arrowImg.autoPinEdge(.Left, toEdge: .Right, ofView: moreLable, withOffset: 0)
            arrowImg.autoPinEdgeToSuperviewEdge(.Top, withInset: 17.5)
            
            
            //按钮
            let moreBtn = UIButton.init(type: UIButtonType.Custom)
            moreBtn.backgroundColor = UIColor.clearColor()
            headerView.addSubview(moreBtn)
            moreBtn.addTarget(self, action:#selector(moreBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
            
            
            let btnSize = CGSizeMake(55, 30)
            moreBtn.autoSetDimensionsToSize(btnSize)
            moreBtn.autoPinEdgeToSuperviewEdge(.Top, withInset: 15)
            moreBtn.autoPinEdgeToSuperviewEdge(.Left, withInset: kScreenWidth - 60)
   
        }

        return headerView
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated:true)
        
        
    }
    
    
    /*
    //区头跟随cell移动
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let sectionHeaderHeight:CGFloat = 50;

        if scrollView == tableView {
            
            if scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= -64  {
                scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0)
            }else if (scrollView.contentOffset.y >= sectionHeaderHeight){
                
                scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);

            }
        }
    }
    
    */
    
    
    // MARK: 头部点击事件
    func topBtnClick(){
        
        let vc = SearchViewController()
        self.presentViewController(vc, animated: false, completion: nil)
    }
    
    
    // MARK: 主题点击更多
    func moreBtnClick(){
        
        let vc = SpecialTableViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
