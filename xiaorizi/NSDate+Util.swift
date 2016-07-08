//
//  NSDate+Util.swift
//  E_EducationBySwift
//
//  Created by JohnSon on 15/12/24.
//  Copyright © 2015年 JohnSon. All rights reserved.
//

import Foundation


//
//  NSDate.swift
//  E_Education
//
//  Created by admin on 14-10-9.
//  Copyright (c) 2014年 TFQ. All rights reserved.
//
import UIKit
extension NSDate{
    func stringWithFormat(format format:String)->String{
        let formatter:NSDateFormatter=NSDateFormatter()
        formatter.dateFormat=format
        return formatter.stringFromDate(self)
    }
    class func dateWithFormat(format:String,dateString:String)->NSDate!{
        let formatter:NSDateFormatter=NSDateFormatter()
        formatter.dateFormat=format
        return formatter.dateFromString(dateString)
    }
    func getAge()->Int{
        // 出生日期转换 年月日
/// change: Swift 2.0 以前是以 '|'分割即位运算的方式  如下
/// let components = NSCalendar.currentCalendar().components(NSCalendarUnit.Day | NSCalendarUnit.Month | NSCalendarUnit.Year, fromDate: self)

 /// Swift 2.0 以后改成 [,,] 数组的形式 如下
        
        let components = NSCalendar.currentCalendar().components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: self)
        
        /// 说明: 如果一个变量声明但是没有使用的话,系统会提示修改成 '_' 代替,所以尽量避免声明无用的变量
        //let day = components.day
        // _ = components.day

        
        let birthDateDay:Int = components.day
        let birthDateMonth:Int = components.month
        let birthDateYear:Int = components.year
        
        // 获取系统当前 年月日
        let components2 = NSCalendar.currentCalendar().components([NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year], fromDate: NSDate())
        let currentDateDay:Int = components2.day
        let currentDateMonth:Int = components2.month
        let currentDateYear:Int = components2.year
        var age:Int = currentDateYear - birthDateYear - 1
        
        if ((currentDateMonth > birthDateMonth) || (currentDateMonth == birthDateMonth && currentDateDay >= birthDateDay))
        {
            age += 1 // ++is deprecatd: it will be removed in Swift 3, += 1 instead
        }
        return age
    }
}