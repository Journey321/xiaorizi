//
//  NetWorkTool.swift
//  AlamofireDemo
//
//  Created by JohnSon on 16/7/22.
//  Copyright © 2016年 JohnSon. All rights reserved.
//

import UIKit
import Alamofire
class NetWorkTool: NSObject {
    
    /// 创建单例
    static let shareInstance : NetWorkTool = {
        let tools = NetWorkTool()
        return tools
    }()

    // GET请求
    func getRequest(url:String,params:[String:AnyObject],success:(responseObject:[String:AnyObject])->(), failture:(error:NSError)->()){
        Alamofire.request(.GET,url,parameters:params).responseJSON
            {response in
                switch response.result {
                case.Success:
                    if let value = response.result.value as? [String:AnyObject] {
                        success(responseObject: value)
                    }
                case .Failure(let error):
                    failture(error: error)
                }
        }
    }
    
    // POST请求
    func postRequest(url:String,params:[String:AnyObject],success:(responseObject:[String:AnyObject])->(), failture:(error:NSError)->()){
        Alamofire.request(.POST,url,parameters: params).responseJSON
            {response in
                switch response.result {
                case.Success:
                    if let value = response.result.value as? [String : AnyObject] {
                        success(responseObject: value)
                    }
                case .Failure(let error):
                    failture(error: error)
                }
        }
    }
}
