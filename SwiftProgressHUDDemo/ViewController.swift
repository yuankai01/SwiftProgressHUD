//
//  ViewController.swift
//  SwiftProgressHUDDemo
//
//  Created by YJHou on 2016/3/12.
//  Copyright © 2016年 侯跃军. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        SwiftProgressHUD.showSuccess("成功")
    }
    
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        SwiftProgressHUD.hideAllHUD()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

