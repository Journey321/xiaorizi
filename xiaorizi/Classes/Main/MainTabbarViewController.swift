//
//  MainTabbarViewController.swift
//  xiaorizi
//
//  Created by JohnSon on 16/7/8.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

import CYLTabBarController
class MainTabbarViewController: CYLTabBarController {
    // 标题数组
    let titleArr = ["小日子","好玩","找店","我的"]
    // 普通图片数组
    let normalImgArr = ["life_1","fun_1","fstore_1","my_1"]
    // 选中图片数组
    let selectedImgArr = ["life_2","fun_2","fstore_2","my_2"]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabbar()
    }

    //MARK: -- init with tabbar
    func setupTabbar(){
        var tabBarItemsAttributes: [[NSObject:AnyObject]] = []
        var viewControllers:[UIViewController] = []
        
        let smallNav = UINavigationController(rootViewController: SmallDayViewController())
        let playNav = UINavigationController(rootViewController: PlayViewController())
        let findNav = UINavigationController(rootViewController: FindViewController())
        let mineNav = UINavigationController(rootViewController: MineViewController())
        let controllerArr = [smallNav,playNav,findNav,mineNav]
        
        for i in 0 ... titleArr.count-1 {
            let dict: [NSObject : AnyObject] = [
                CYLTabBarItemTitle: titleArr[i],
                CYLTabBarItemImage: normalImgArr[i],
                CYLTabBarItemSelectedImage: selectedImgArr[i]
            ]
            let vc = controllerArr[i]
            tabBarItemsAttributes.append(dict)
            viewControllers.append(vc)
        }
        self.tabBarItemsAttributes = tabBarItemsAttributes
        self.viewControllers = viewControllers
        
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
