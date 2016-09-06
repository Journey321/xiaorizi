//
//  UserManager.swift
//  xiaorizi
//
//  Created by zhike on 16/9/6.
//  Copyright © 2016年 zhike. All rights reserved.
//

//public let UserNickname = "UserNickname"

import UIKit

class UserManager: UIViewController {
    
    let defaults = NSUserDefaults()

    func setUserNickname() -> NSString {
    
         defaults.setObject("", forKey: UserNickname as String)
        
        return "22"
        
    }
    
    func getUserNickName()-> NSString{
        
        defaults.objectForKey(UserNickname as String)
        return "22"
    }
    
    
    
}
