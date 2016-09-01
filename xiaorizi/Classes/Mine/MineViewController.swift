//
//  MineViewController.swift
//  xiaorizi
//
//  Created by JohnSon on 16/7/8.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {
//    背景
    var bgScrollView : UIScrollView!
    var topImageView = UIImageView.init();
    var categoryView = UIView.init()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
//        self.hidesBottomBarWhenPushed = true
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的"
        self.view.backgroundColor = UIColor.init(rgbByFFFFFF: 0xf9f9f9)

        setupNav()
        background()
    }

    
    // MARK: 初始化导航栏
    func setupNav(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.barButtonItemWithLeftIcon("news_3", highlightedIcon: "", target: self, action: #selector(MineViewController.privateMsgBtnClick))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.barButtonItemWithRightIcon("pcenter_1", highlightedIcon: "", target: self, action: #selector(MineViewController.personInfoBtnClick))
        
    }
    
    
    func background(){
        
//        背景scrollView
        bgScrollView = UIScrollView.init();
        self.view.addSubview(bgScrollView)
        bgScrollView.backgroundColor = UIColor.init(rgbByFFFFFF: 0xf9f9f9)
        bgScrollView.translatesAutoresizingMaskIntoConstraints = false
        bgScrollView.bounces = false
//        布局
        bgScrollView.autoPinEdgeToSuperviewEdge(.Top, withInset: 0)
        bgScrollView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        bgScrollView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 0)
        bgScrollView.autoPinEdgeToSuperviewEdge(.Right, withInset: 0)
        bgScrollView.contentSize = CGSizeMake(self.view.width(), kScreenHeight*(590/667))
        topBGView()
        categoryBGView()

    }
    
    func topBGView(){
        
//        顶部view
        bgScrollView.addSubview(topImageView)
        topImageView.userInteractionEnabled = true;
        topImageView.autoPinEdgeToSuperviewEdge(.Top, withInset: -20)
        topImageView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        let topSize = CGSizeMake(kScreenWidth, kScreenHeight*(215/667));
        topImageView.autoSetDimensionsToSize(topSize);
        topImageView.image = UIImage.init(named: "defaultbackground")
        
        
//        设置按钮
        let setBtn = UIButton.init(type: UIButtonType.Custom)
        bgScrollView.addSubview(setBtn)
        setBtn.backgroundColor = UIColor.clearColor()
        setBtn.setImage(UIImage.init(named: "set_1"), forState: UIControlState.Normal)
        setBtn.autoPinEdge(.Top, toEdge: .Bottom, ofView: bgScrollView, withOffset: -15.0)
        setBtn.autoPinEdge(.Left, toEdge: .Right, ofView: bgScrollView, withOffset:kScreenWidth - 60)
        let size = CGSizeMake(70, 70);
        setBtn.autoSetDimensionsToSize(size);
        
        
//        头像
        let headerBtn = UIButton.init(type: UIButtonType.Custom);
        headerBtn.backgroundColor = UIColor.whiteColor()
        topImageView.addSubview(headerBtn)
        headerBtn.clipsToBounds = true;
        headerBtn.layer.cornerRadius = 50;
        headerBtn.setImage(UIImage.init(named: "lhshare0"), forState: UIControlState.Normal)
        
//        布局
        let btnWidth:CGFloat = 100.0;
        let headerSize = CGSizeMake(kScreenWidth * (btnWidth / 375), kScreenHeight * (btnWidth / 667));
        headerBtn.autoSetDimensionsToSize(headerSize);
        headerBtn.autoPinEdgeToSuperviewEdge(ALEdge.Leading, withInset: (kScreenWidth - kScreenWidth * (btnWidth / 375)) / 2)
        headerBtn.autoPinEdgeToSuperviewEdge(ALEdge.Top, withInset: kScreenHeight * (50 / 667))
        
        
//        昵称
        let nickLable = UILabel.init();
        topImageView.addSubview(nickLable)
        nickLable.backgroundColor = UIColor.clearColor()
        nickLable.textAlignment = NSTextAlignment.Center;
        nickLable.text = "豆豆的皮豆"
        nickLable.font = UIFont.systemFontOfSize(18)
        nickLable.textColor = UIColor.whiteColor()
        let nickSize = CGSizeMake(kScreenWidth, 20);
        nickLable.autoSetDimensionsToSize(nickSize);
        nickLable.autoPinEdgeToSuperviewEdge(ALEdge.Leading, withInset: 0)
        nickLable.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: headerBtn, withOffset: 5)
        
        
//      编辑资料
        let editBtn = UIButton.init(type: UIButtonType.Custom)
        topImageView.addSubview(editBtn)
        editBtn.backgroundColor = UIColor.clearColor()
        let editBtnSize = CGSizeMake(80, 20);
        editBtn.autoSetDimensionsToSize(editBtnSize);
        editBtn.autoPinEdgeToSuperviewEdge(ALEdge.Right, withInset: 10)
        editBtn.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: topImageView, withOffset: -30)
        editBtn.addTarget(self, action:#selector(MineViewController.editBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        let editLable = UILabel.init()
        topImageView.addSubview(editLable)
        editLable.textColor = UIColor.whiteColor()
        editLable.backgroundColor = UIColor.clearColor()
        editLable.text = "编辑资料"
        editLable.textAlignment = NSTextAlignment.Center
        editLable.font = UIFont.systemFontOfSize(14)
        let editLableSize = CGSizeMake(60, 20);
        editLable.autoSetDimensionsToSize(editLableSize);
        editLable.autoPinEdgeToSuperviewEdge(ALEdge.Right, withInset: 10)
        editLable.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: topImageView, withOffset: -30)
        
        
//        图标
        let editIconImg = UIImageView.init();
        topImageView.addSubview(editIconImg)
        editIconImg.backgroundColor = UIColor.clearColor()
        editIconImg.image = UIImage.init(named: "edit")
        let editIconSize = CGSizeMake(20, 20);
        editIconImg.autoSetDimensionsToSize(editIconSize);
        
//        跟lable对齐
        editIconImg.autoAlignAxis(ALAxis.Horizontal, toSameAxisOfView: editLable)
        
//        跟lable的距离 withOffset
        editIconImg.autoPinEdge(ALEdge.Trailing, toEdge: ALEdge.Leading, ofView: editLable, withOffset: 0, relation: NSLayoutRelation.GreaterThanOrEqual)
        editLable.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: topImageView, withOffset: -30)

    }
    
    
    func categoryBGView(){
        
//       类别背景view
        categoryView.backgroundColor = UIColor.init(rgbByFFFFFF: 0xf9f9f9)
        bgScrollView.addSubview(categoryView)
        
        let categorySize = CGSizeMake(kScreenWidth, kScreenHeight*(300/667))
        categoryView.autoSetDimensionsToSize(categorySize);
        categoryView.autoPinEdgeToSuperviewEdge(ALEdge.Leading, withInset: 0)
        categoryView.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: topImageView, withOffset: 0)
        
        
        let nameArray : NSArray = ["消息","订单","想去","收藏","我的推荐","申请店主"];
        let iconArray : NSArray = ["news_3","orderform","titleshare_1","plike_1","sendpictures_1","shop"];
        
        let btnWidth:CGFloat = (kScreenWidth - 1)/2.0
        let btnHeight:CGFloat = 100;
        
        for i in 0 ... nameArray.count-1  {
            
            let XX:CGFloat = CGFloat(i%2)
            let YY:CGFloat = CGFloat(i/2)
            let interval:CGFloat = 1
            let x = XX * (interval + btnWidth)
            let y = YY * (interval + btnHeight);
            let iconName = iconArray.objectAtIndex(i)
            let btn = MyCustomBtn.init(type: UIButtonType.Custom)
            btn.frame = CGRectMake(x, y, btnWidth, btnHeight)
            btn.nameLable.text = nameArray.objectAtIndex(i) as? String
            btn.iconImg.image = UIImage.init(named: iconName as! String)
            categoryView.addSubview(btn)
            btn.tag = i + 1;
            btn.addTarget(self, action: #selector( MineViewController.orderBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        let bottomLable = UILabel.init()
        bgScrollView.addSubview(bottomLable)
        bottomLable.text = "~发现美好生活~";
        bottomLable.textColor = UIColor.init(rgbByFFFFFF: 0xb7b7b7)
        bottomLable.font = UIFont.systemFontOfSize(14)
        bottomLable.textAlignment = NSTextAlignment.Center
        let bottomSize = CGSizeMake(kScreenWidth, 20)
        bottomLable.autoSetDimensionsToSize(bottomSize)
        bottomLable.autoPinEdge(.Top, toEdge: .Bottom, ofView: categoryView, withOffset: 30)
        
        
    }
    
    
    
    
    // MARK: 导航栏按钮点击事件
    func privateMsgBtnClick() {
        
    }
    func personInfoBtnClick() {
        
    }
    
    func editBtnClick(){
        print("---编辑资料----")
        
    }
    
    func orderBtnClick(btn:UIButton){
        
        print("-----------",btn.tag)
    
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
