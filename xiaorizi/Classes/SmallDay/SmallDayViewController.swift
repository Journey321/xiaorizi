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
        
        setupNav()
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
