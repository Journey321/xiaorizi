//
//  SmallDayViewController.swift
//  xiaorizi
//
//  Created by JohnSon on 16/7/8.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

class SmallDayViewController: UIViewController {
    
    var cityBtn: TextImageButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "小日子"
        self.view.backgroundColor = UIColor.blueColor()
        
        let button = UIButton(type: UIButtonType.Custom)
        button.frame = CGRectMake(100, 100, 100, 30)
        button.backgroundColor = UIColor.redColor()
        button.addTarget(self, action: #selector(SmallDayViewController.btnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func btnClick(button:UIButton){
        
        // 1 创建分享参数
        
        let shareParemes = NSMutableDictionary()
        shareParemes.SSDKSetupShareParamsByText("分享内容", images:UIImage(named:"collect.png"), url:  NSURL(string:"http://mob.com"), title: "分享标题", type:
            SSDKContentType.Image)
        
        ShareSDK.showShareActionSheet(view, items:nil, shareParams: shareParemes) { (state : SSDKResponseState, type:SSDKPlatformType, userData : [NSObject : AnyObject]!, contentEntity :SSDKContentEntity!, error : NSError!, end:Bool) in
            
            switch state{
            case SSDKResponseState.Success:
                print("分享成功")
            case SSDKResponseState.Fail:
                print("分享失败,错误描述:\(error)")
            case SSDKResponseState.Cancel:
                print("分享取消")
            default:
                break
                
            }
        }
        
    }
    
    
    // MARK: 初始化导航栏
    func setupNav(){
        cityBtn = TextImageButton(frame: CGRectMake(0, 20, 80, 44))
        cityBtn.setTitle("上海", forState: UIControlState.Normal)
        cityBtn.titleLabel!.font = theme.navItemFont
        cityBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        cityBtn.setImage(UIImage(named: "city_1"), forState: UIControlState.Normal)
        cityBtn.addTarget(self, action: #selector(SmallDayViewController.selectedCityBtnClick), forControlEvents: .TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cityBtn)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.barButtonItemWithRightIcon("camera5", highlightedIcon: "", target: self, action: #selector(SmallDayViewController.shareBtnClick))
    }
    // MARK: 导航栏按钮点击事件
    func shareBtnClick() {
        
    }
    
    func selectedCityBtnClick() {
        
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
