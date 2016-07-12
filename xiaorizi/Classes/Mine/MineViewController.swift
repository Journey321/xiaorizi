//
//  MineViewController.swift
//  xiaorizi
//
//  Created by JohnSon on 16/7/8.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的"
        self.view.backgroundColor = UIColor.yellowColor()

        setupNav()
    
    }

    
    // MARK: 初始化导航栏
    func setupNav(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.barButtonItemWithLeftIcon("news_3", highlightedIcon: "", target: self, action: #selector(MineViewController.privateMsgBtnClick))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.barButtonItemWithRightIcon("pcenter_1", highlightedIcon: "", target: self, action: #selector(MineViewController.personInfoBtnClick))
        
    }
    // MARK: 导航栏按钮点击事件
    func privateMsgBtnClick() {
        
    }
    func personInfoBtnClick() {
        
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
