//
//  MainViewController.swift
//  SwiftProgressHUDDemo
//
//  Created by YJHou on 2016/3/12.
//  Copyright © 2016年 侯跃军. All rights reserved.
//

import UIKit
import CommonParameter
import YJSwiftExtensions

fileprivate let btnW = 60.0, btnH = 38.0, rightMargin = 10.0, fontSize = 13.0

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        _setUpShowDifferenceMainView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MainViewController {
    
    func _setUpShowDifferenceMainView() -> () {
        
        let btnVGap = (kSCREEN_HEIGHT - btnH * 7) / 8.0
        let btnFont = UIFont.systemFont(ofSize: CGFloat(fontSize))
        let btnX = kSCREEN_WIDTH - btnW - rightMargin
        
        let showWaitBtn = getBtn(frame: CGRect(x: btnX, y: btnVGap, width: btnW, height: btnH), cornerRadius: btnH * 0.5, title: "等待", btnFont: btnFont, btnTag: 1)
        view.addSubview(showWaitBtn)
        
        let showSuccessBtn = getBtn(frame: CGRect(x: btnX, y: btnVGap + (btnVGap + btnH), width: btnW, height: btnH), cornerRadius: btnH * 0.5, title: "成功", btnFont: btnFont, btnTag: 2)
        view.addSubview(showSuccessBtn)
        
        let showFailBtn = getBtn(frame: CGRect(x: btnX, y: btnVGap + (btnVGap + btnH) * 2, width: btnW, height: btnH), cornerRadius: btnH * 0.5, title: "失败", btnFont: btnFont, btnTag: 3)
        view.addSubview(showFailBtn)
        
        let showInfoBtn = getBtn(frame: CGRect(x: btnX, y: btnVGap + (btnVGap + btnH) * 3, width: btnW, height: btnH), cornerRadius: btnH * 0.5, title: "信息提示", btnFont: btnFont, btnTag: 4)
        view.addSubview(showInfoBtn)
        
        let showOnlyTextBtn = getBtn(frame: CGRect(x: btnX, y: btnVGap + (btnVGap + btnH) * 4, width: btnW, height: btnH), cornerRadius: btnH * 0.5, title: "文字", btnFont: btnFont, btnTag: 5)
        view.addSubview(showOnlyTextBtn)
        
        let showOnStatusBarBtn = getBtn(frame: CGRect(x: btnX, y: btnVGap + (btnVGap + btnH) * 5, width: btnW, height: btnH), cornerRadius: btnH * 0.5, title: "状态栏", btnFont: btnFont, btnTag: 6)
        view.addSubview(showOnStatusBarBtn)
        
        let showAnimationImagesBtn = getBtn(frame: CGRect(x: btnX, y: btnVGap + (btnVGap + btnH) * 6, width: btnW, height: btnH), cornerRadius: btnH * 0.5, title: "动画", btnFont: btnFont, btnTag: 7)        
        view.addSubview(showAnimationImagesBtn)
        
        /// 停止HUD
//        let stopBtn = getBtn(frame: CGRect(x: rightMargin, y: kSCREEN_HEIGHT - btnVGap - btnH, width: btnW, height: btnH), cornerRadius: btnH * 0.5, title: "停止", btnFont: btnFont, btnTag: 8)
//        view.addSubview(stopBtn)

    }
    
    /// 点击事件
    func showBtnActionClick(btn: UIButton) {
        let btnTag = btn.tag
        if btnTag == 1 { // wait
            
            SwiftProgressHUD.showWait()
            
            /// 模拟 1s后 加载完成
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                SwiftProgressHUD.hideAllHUD()
            }
            
        }else if btnTag == 2 { // success
            
            SwiftProgressHUD.showSuccess("加载成功")
            
            /// 模拟 1s后 加载完成
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                SwiftProgressHUD.hideAllHUD()
            }
        
        }else if btnTag == 3 { // fail
            
            SwiftProgressHUD.showFail("加载失败")
            
            /// 模拟 1s后 加载完成
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                SwiftProgressHUD.hideAllHUD()
            }

        }else if btnTag == 4 { // info
            
            SwiftProgressHUD.showInfo("请稍后")
            
            /// 模拟 1s后 加载完成
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                SwiftProgressHUD.hideAllHUD()
            }
        
        }else if btnTag == 5 { // showOnlyText
            
            SwiftProgressHUD.showOnlyText("请输入合法的手机号")
            
            /// 模拟 1s后 加载完成
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                SwiftProgressHUD.hideAllHUD()
            }
        
        }else if btnTag == 6 { // showOnStatusBar
            
            SwiftProgressHUD.showOnStatusBar("你有一条新消息")
            
            /// 模拟 1s后 加载完成
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                SwiftProgressHUD.hideAllHUD()
            }
            
        }else if btnTag == 7 { // showAnimationImages
            
        }else if btnTag == 8 { // stop
            
            SwiftProgressHUD.hideAllHUD()
        }

    }
}

// MARK: - 方法提供
extension MainViewController {
    
    /// 创建btn
    func getBtn(frame: CGRect, cornerRadius: Double, title: String, btnFont: UIFont, btnTag: Int) -> UIButton {
        let btn = UIButton(frame: frame)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = btnFont
        btn.backgroundColor = UIColor.yj_randomColor()
        btn.addTarget(self, action: #selector(showBtnActionClick(btn:)), for: .touchUpInside)
        btn.tag = btnTag
        btn.layer.cornerRadius = CGFloat(cornerRadius)
        btn.layer.masksToBounds = true
        return btn
    }
    
}
