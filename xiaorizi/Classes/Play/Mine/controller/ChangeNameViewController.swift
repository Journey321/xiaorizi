//
//  ChangeNameViewController.swift
//  xiaorizi
//
//  Created by zhike on 16/9/2.
//  Copyright © 2016年 zhike. All rights reserved.
//

/*
enum EditType : Int  {
 
    case Nickname   = 1   //昵称
    case Signature  = 2   //签名
    case Email      = 3   //邮箱
    case Phone      = 4   //手机号
}
 */
import UIKit

class ChangeNameViewController: UIViewController {


    var navigationTittle = ""
    var placeholderStr = ""
    var EditType : Int = 0
    var textFiled  = UITextField()
    /// block传值，也叫闭包传值
    var editChange :((title:String)->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = navigationTittle
        self.view.backgroundColor = UIColor.init(rgbByFFFFFF: 0xf9f9f9)
        
        let rightItem = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ChangeNameViewController.rightItemClick))
        self.navigationItem.rightBarButtonItem = rightItem
        
        
        let backItem = UIBarButtonItem(title: "", style: .Plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backItem;
        
        
        let bgView = UIView.init()
        bgView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(bgView)
        let bgViewSize = CGSizeMake(kScreenWidth, 50)
        bgView.autoSetDimensionsToSize(bgViewSize)
        bgView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        bgView.autoPinEdgeToSuperviewEdge(.Top, withInset: 10 + 64)
        
        
        textFiled = UITextField.init()
        textFiled.placeholder = placeholderStr
        textFiled.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(textFiled)
        textFiled.clearButtonMode = UITextFieldViewMode.WhileEditing
        let textFieldSize = CGSizeMake(kScreenWidth - 20, 50)
        textFiled.autoSetDimensionsToSize(textFieldSize)
        textFiled.autoPinEdgeToSuperviewEdge(.Left, withInset: 15)
        textFiled.autoPinEdgeToSuperviewEdge(.Top, withInset: 10 + 64)
        
        switch EditType {
        case 1:
            textFiled.text = NSUserDefaults.standardUserDefaults().objectForKey(UserNickname as String) as? String
        case 2:
            textFiled.text = NSUserDefaults.standardUserDefaults().objectForKey(UserSignature as String) as? String
        case 3:
            textFiled.text = NSUserDefaults.standardUserDefaults().objectForKey(UserEmail as String) as? String
        case 4:
            textFiled.text = NSUserDefaults.standardUserDefaults().objectForKey(UserPhone as String) as? String
            
        default:
            break
        }
        
        
    }
    
    
    
    
    func rightItemClick(){
        
        let hud : MBProgressHUD
            = MBProgressHUD.showHUDAddedTo(self.navigationController!.view, animated: true)
        hud.backgroundView.style = MBProgressHUDBackgroundStyle.SolidColor;
        hud.backgroundView.color = UIColor.blackColor()
        hud.backgroundView.alpha = 0.3
        hud.mode = .Text
        hud.bezelView.color = UIColor.blackColor()
        hud.detailsLabel.textColor = UIColor.whiteColor()
        hud.removeFromSuperViewOnHide = true
   
    
        
//        邮箱
        if self.EditType == 3 {
            
            if textFiled.text!.validateEmail() {
                hud.detailsLabel.text = "保存成功"
                editChange?(title: textFiled.text!)
                NSUserDefaults.standardUserDefaults().setObject(textFiled.text, forKey: UserEmail as String)
                self.navigationController?.popViewControllerAnimated(true)
                
            }else{
                
                hud.detailsLabel.text = "邮箱有误，请输入正确邮箱地址"
            }

        }
        
        
//        用户名和签名
        if self.EditType == 1 || self.EditType == 2  {
            
            if textFiled.text?.isEmpty == false {
                
                editChange?(title: textFiled.text!)

                hud.detailsLabel.text = "保存成功"
                NSUserDefaults.standardUserDefaults().setObject(textFiled.text, forKey: (self.EditType == 1 ? UserNickname : UserSignature) as String)
                self.navigationController?.popViewControllerAnimated(true)
                
            }else{
                
                hud.detailsLabel.text = "不能为空"
            }
        }
        
        
//        电话
        if self.EditType == 4 {
            
            if textFiled.text!.validateMobile() {
                hud.detailsLabel.text = "保存成功"
                editChange?(title: textFiled.text!)
                NSUserDefaults.standardUserDefaults().setObject(textFiled.text, forKey: UserPhone as String)
                self.navigationController?.popViewControllerAnimated(true)
                
            }else{
                
                hud.detailsLabel.text = "请输入正确的手机号码"
            }
        }
 
        hud.hideAnimated(true, afterDelay: 1.5)

    }
    
}
