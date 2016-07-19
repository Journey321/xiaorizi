//
//  AppDelegate.swift
//  xiaorizi
//
//  Created by zhike on 16/7/4.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate  {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // 全局设置导航栏样式
        setupNavStyle(application)
        customizeInterface()
        self.window!.rootViewController = MainTabbarViewController()
        share()
        return true
    }

    func share(){

        ShareSDK.registerApp("845cb98583e7",

            activePlatforms: [SSDKPlatformType.TypeWechat.rawValue,SSDKPlatformType.TypeQQ.rawValue],

            onImport: {(platform : SSDKPlatformType) -> Void in

                switch platform{

                case SSDKPlatformType.TypeWechat:
                   ShareSDKConnector.connectWeChat(WXApi.classForCoder())
                case SSDKPlatformType.TypeQQ:
                    ShareSDKConnector.connectQQ(QQApiInterface.classForCoder(), tencentOAuthClass: TencentOAuth.classForCoder())
                    break
                default:
                    break
                }
            },

            onConfiguration: {(platform : SSDKPlatformType,appInfo : NSMutableDictionary!) -> Void in
                switch platform {

                case SSDKPlatformType.TypeWechat:
                    //设置微信应用信息
                    appInfo.SSDKSetupWeChatByAppId("wx4d09451d0633a5f8", appSecret: "7c17ed2fb647aff937f72f1a7dd4e966")

                case SSDKPlatformType.TypeQQ:
                    //                                    设置QQ应用信息
                    appInfo.SSDKSetupQQByAppId("1103960594", appKey:"R90DhXXezSTn2aM8", authType:"")

                default:
                    break

                }
        })

    }
//MARK: -- 全局设置导航栏样式
    func setupNavStyle(application:UIApplication){
        application.statusBarStyle = UIStatusBarStyle.LightContent
        //        UINavigationBar.appearance().barTintColor = UIColor.init(red: 244/255, green: 244/255, blue: 243/255, alpha: 1)
        //        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        //        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
    }
    
    /**
     *  tabBarItem 的选中和不选中文字属性、背景图片
     */
    func customizeInterface() {
        
        // 普通状态下的文字属性
        var normalAttrs = [String : AnyObject]()
        
        normalAttrs[NSForegroundColorAttributeName] = UIColor.grayColor()
        
        // 选中状态下的文字属性
        var selectedAttrs = [String : AnyObject]()
        selectedAttrs[NSForegroundColorAttributeName] = UIColor.blackColor()
        
        // 设置文字属性
        let tabBar = UITabBarItem.appearance()
        tabBar.setTitleTextAttributes(normalAttrs, forState: UIControlState.Normal)
        tabBar.setTitleTextAttributes(selectedAttrs, forState: UIControlState.Selected)
        
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

//    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
//
//        return WXApi.handleOpenURL(url, delegate:self)
//    }

//    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject? ) -> Bool{
//
//        return ShareSDK.handleOpenURL(url, sourceApplication: sourceApplication, annotation: annotation, wxDelegate: self)
//    }



    
    
}

