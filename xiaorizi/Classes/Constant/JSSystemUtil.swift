//
//  JSSystemUtil.swift
//  E_EducationBySwift
//
//  Created by JohnSon on 15/12/25.
//  Copyright © 2015年 JohnSon. All rights reserved.
//

import Foundation
import UIKit
/// 用户昵称
public let UserNickname : NSString  = "UserNickname"
/// 用户签名
public let UserSignature : NSString = "UserSignature"
/// 邮箱
public let UserEmail : NSString     = "UserEmail"
/// 电话
public let UserPhone : NSString     = "UserPhone"


 /// 获取系统版本
let  SystemVersion:Float = Float(UIDevice.currentDevice().systemVersion)!
 /// 获取系统名称
let  SystemName:String=UIDevice.currentDevice().systemName
 /// 获取App版本号
let  APP_VERSION = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"]
 /// 获取App名称
let  APP_NAME = NSBundle.mainBundle().infoDictionary!["CFBundleDisplayName"]
 /// 判断是否是IOS7
let  IOS7:Bool = SystemVersion >= 7.0 ? true : false
 /// 判断是否是IOS8
let  IOS8:Bool = SystemVersion >= 8.0 ? true : false
 /// 判断是否是IOS9
let  IOS9:Bool = SystemVersion >= 9.0 ? true : false
 /// 获取屏幕的宽高
public let kScreenBounds = UIScreen.mainScreen().bounds
public let kScreenHeight = UIScreen.mainScreen().bounds.size.height
public let kScreenWidth  = UIScreen.mainScreen().bounds.size.width
 /// 获取系统window
public let kWindow = UIApplication.sharedApplication().keyWindow
 /// 判断当前设备
let IS_IPHONE_4 = fabs(Double(kScreenHeight) - Double(480))<DBL_EPSILON
let IS_IPHONE_5 = fabs(Double(kScreenHeight) - Double(568))<DBL_EPSILON
let IS_IPHONE_6 = fabs(Double(kScreenHeight) - Double(667))<DBL_EPSILON
let IS_IPHONE_6P = fabs(Double(kScreenHeight) - Double(736))<DBL_EPSILON


struct theme {
    ///  APP导航条barButtonItem文字大小
    static let navItemFont: UIFont = UIFont.systemFontOfSize(16)
    ///  APP导航条titleFont文字大小
    static let navTitleFont: UIFont = UIFont.systemFontOfSize(18)
}


