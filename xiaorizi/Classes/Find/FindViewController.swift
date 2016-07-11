//
//  FindViewController.swift
//  xiaorizi
//
//  Created by JohnSon on 16/7/8.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

class FindViewController: UIViewController {

    var cityBtn: TextImageButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "找店"
        self.view.backgroundColor = UIColor.redColor()
        
        setupNav()
        
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
