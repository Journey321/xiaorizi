//
//  MyCenterViewController.swift
//  xiaorizi
//
//  Created by zhike on 16/9/2.
//  Copyright © 2016年 zhike. All rights reserved.
//


import UIKit
import AVFoundation
import Photos

class MyCenterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate {

    var tableView = UITableView()
    /// 名字数组
    var nameArray = NSMutableArray()
    var subTittle = NSMutableArray()
    /// textField占位符数组
    var placeholderArray = NSMutableArray()
    /// 导航栏标题数组
    var navigationTittleArray = NSMutableArray()
    /// 昵称
    var nicknameStr     = ""
    /// 签名
    var signatureStr    = ""
    /// 邮箱
    var emailStr        = ""
    /// 电话
    var phoneStr        = ""
    
    var userHeaderImgSheet = UIAlertController()
    var sourceType = UIImagePickerControllerSourceType.PhotoLibrary

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.hidden = true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "个人中心"
        self.view.backgroundColor = UIColor.whiteColor()
        
        tableView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(tableView)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = UIView.init()
        tableView.scrollEnabled = false
        let size = CGSizeMake(kScreenWidth, 314)
        tableView.autoSetDimensionsToSize(size)
        tableView.autoPinEdgeToSuperviewEdge(.Top, withInset: 0)
        tableView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        
        tableView.registerClass(MyCenterHeaderCell.self, forCellReuseIdentifier: "cellIdentifier")
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

        nameArray = NSMutableArray.init(array: ["用户名","签名","邮箱","手机号"])
        subTittle = NSMutableArray.init(array: ["豆豆的皮豆","","添加邮箱","绑定手机号"])
        placeholderArray = NSMutableArray.init(array: ["请输入您的昵称","请输入您的签名","请输入您的邮箱","请输入手机号"])
        navigationTittleArray = NSMutableArray.init(array: ["用户名","签名","邮箱","手机号"])
        
        
        
        let userNicknameStr = NSUserDefaults.standardUserDefaults().objectForKey(UserNickname as String)
        
        let userSingayureStr = NSUserDefaults.standardUserDefaults().objectForKey(UserSignature as String) as! String!

        let userEmailStr = NSUserDefaults.standardUserDefaults().objectForKey(UserEmail as String) as! String!

        let userPhoneStr = NSUserDefaults.standardUserDefaults().objectForKey(UserPhone as String) as! String!


        nicknameStr = (userNicknameStr == nil) ? "" : (userNicknameStr as! NSString ) as String
        signatureStr = (userSingayureStr == nil) ? "" : (userSingayureStr as NSString ) as String
        emailStr = (userEmailStr == nil) ? "" : (userEmailStr as NSString ) as String
        phoneStr = (userPhoneStr == nil) ? "" : userPhoneStr as NSString as String
        
        
        
//        退出登录
        let exitBtn = UIButton.init(type: UIButtonType.Custom)
        self.view.addSubview(exitBtn)
        exitBtn.backgroundColor = UIColor.init(rgbByFFFFFF: 0xf45633)
        exitBtn.setTitle("退出登录", forState: UIControlState.Normal)
        exitBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        exitBtn.titleLabel?.font = UIFont.systemFontOfSize(16)
        exitBtn.layer.masksToBounds = true
        exitBtn.layer.cornerRadius = 10;
        let exitSize = CGSizeMake(kScreenWidth - 60, 40)
        exitBtn.autoSetDimensionsToSize(exitSize)
        exitBtn.autoPinEdgeToSuperviewEdge(.Left, withInset: 30)
        exitBtn.autoPinEdge(.Top, toEdge: .Bottom, ofView: tableView, withOffset: 30)
        
        exitBtn.addTarget(self, action: #selector(MyCenterViewController.exitBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    
    func exitBtnClick(){
        print("-----退出------")
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        
        if indexPath.row == 0 {
            let cell = MyCenterHeaderCell.init(style: UITableViewCellStyle.Value1, reuseIdentifier: "cellIdentifier")
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell.selectionStyle = UITableViewCellSelectionStyle.None;
            cell.tag = 99;
            return cell;

        }
        
        let cell = UITableViewCell.init(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell")
        cell.textLabel?.text = nameArray.objectAtIndex(indexPath.row - 1) as? String
        cell.detailTextLabel?.text = subTittle.objectAtIndex(indexPath.row - 1) as? String
        
        switch indexPath.row {
        case 1:
            cell.detailTextLabel?.text = nicknameStr.isEmpty ? (subTittle.objectAtIndex(1 - 1) as? String) : nicknameStr
        case 2:
            cell.detailTextLabel?.text = signatureStr.isEmpty ? (subTittle.objectAtIndex(2 - 1) as? String) : signatureStr

        case 3:
            cell.detailTextLabel?.text = emailStr.isEmpty ? (subTittle.objectAtIndex(3 - 1) as? String) : emailStr
        case 4:
            cell.detailTextLabel?.text = phoneStr.isEmpty ? (subTittle.objectAtIndex(4 - 1) as? String) : phoneStr
        default: break
            
        }
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.selectionStyle = UITableViewCellSelectionStyle.None;
        cell.tag = indexPath.row + 1;
        return cell;
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row > 0 {
            let vc = ChangeNameViewController()
            vc.navigationTittle = navigationTittleArray.objectAtIndex(indexPath.row - 1) as! String
            vc.placeholderStr = placeholderArray.objectAtIndex(indexPath.row - 1) as! String
            vc.EditType = indexPath.row;
            vc.editChange = { (title:String) in
            
                let cell = tableView.viewWithTag(indexPath.row + 1)as! UITableViewCell
                cell.detailTextLabel?.text = title
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.row == 0 {
            
       
   
             userHeaderImgSheet = UIAlertController.init(title: "请选择操作", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            let alertSheetAction = UIAlertAction.init(title: "拍照", style: UIAlertActionStyle.Default) { (UIAlertAction) in
                self.openCamera()
            }
        
        
            let alertPhotoSheetAction = UIAlertAction.init(title: "从手机相册选择", style: UIAlertActionStyle.Default){ (UIAlertAction) in
                self.openUserPhotoLibrary()

            }
            
            
            let sureSheetAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
            
            userHeaderImgSheet.addAction(alertSheetAction)
            userHeaderImgSheet.addAction(alertPhotoSheetAction)
            userHeaderImgSheet.addAction(sureSheetAction)
        
            self.presentViewController(userHeaderImgSheet, animated: true, completion: nil)
         }
        
        

        
    }

//        打开相机
    func openCamera(){
        if self.cameraPermission() == true{
            
            self.sourceType = UIImagePickerControllerSourceType.Camera
            self.open()
            
        }else{
            
            self.userHeaderImgSheet = UIAlertController.init(title: "温馨提示", message: "请在设置中打开相机权限", preferredStyle: UIAlertControllerStyle.Alert)
            let tempAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.Cancel, handler: nil)
            self.userHeaderImgSheet.addAction(tempAction)
            self.presentViewController(self.userHeaderImgSheet, animated: true, completion: nil)
            
        }
    }

    
//      打开相册
    func openUserPhotoLibrary(){
        
        if self.cameraPermission() == true{
            self.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.open()
            
        }else{
            self.userHeaderImgSheet = UIAlertController.init(title: "温馨提示", message: "请在设置中打开相册权限", preferredStyle: UIAlertControllerStyle.Alert)
            let tempAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.Cancel, handler: nil)
            self.userHeaderImgSheet.addAction(tempAction)
            self.presentViewController(self.userHeaderImgSheet, animated: true, completion: nil)
            
        }
        

    }
    
//    打开相机或者相册
    func open(){
    
        if UIImagePickerController.isSourceTypeAvailable(self.sourceType) {
            let imagePickController:UIImagePickerController = UIImagePickerController()
            imagePickController.delegate = self
            imagePickController.allowsEditing = true
            imagePickController.sourceType = self.sourceType
            self.presentViewController(imagePickController, animated: true, completion: {
            })
        }else{
            
            
            let hud : MBProgressHUD
                = MBProgressHUD.showHUDAddedTo(self.navigationController!.view, animated: true)
            hud.backgroundView.style = MBProgressHUDBackgroundStyle.SolidColor;
            hud.backgroundView.color = UIColor.blackColor()
            hud.backgroundView.alpha = 0.3
            hud.mode = .Text
            hud.bezelView.color = UIColor.blackColor()
            hud.detailsLabel.textColor = UIColor.whiteColor()
            hud.removeFromSuperViewOnHide = true
            hud.detailsLabel.text = "模拟器没有摄像头,请链接真机调试"
            hud.hideAnimated(true, afterDelay: 1.5)

        }
    
    }

    //    选择完图片操作
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {

        let cell = tableView.viewWithTag(99)as! MyCenterHeaderCell
    
        cell.headerImageView.image = image
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
//    判断相册权限
    func photoLibryPermissions() -> Bool{
        
        let library : PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        if library == PHAuthorizationStatus.Denied || library == PHAuthorizationStatus.Restricted {
            return false
        }else{
            
            return true
        }
    }
    
    
//    判断相机权限
    func cameraPermission() -> Bool{
        
        let autnStatus : AVAuthorizationStatus = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo)
        if autnStatus == AVAuthorizationStatus.Denied || autnStatus == AVAuthorizationStatus.Restricted {
            
            return false
            
        }else{
            
            return true
        }
        
    }
    
}




























