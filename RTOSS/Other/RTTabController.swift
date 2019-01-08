//
//  RTTabController.swift
//  RTOSS
//
//  Created by isoft on 2019/1/7.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class RTTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //配置主控制器
        let vc1 = HomeVC()
        self.addChildViewController(childerVC: vc1, title: "首页", normalImg: "", selectedImg: "")
        
        let vc2 = DeviceVC()
         self.addChildViewController(childerVC: vc2, title: "设备", normalImg: "", selectedImg: "")
        
        let vc3 = MineVC()
         self.addChildViewController(childerVC: vc3, title: "我的", normalImg: "", selectedImg: "")
        
        self.selectedIndex = 0
        
        
    }
    
    //添加子控制器
    func addChildViewController(childerVC:UIViewController,title:NSString,normalImg:NSString,selectedImg:NSString)  {
        
        self.tabBarItem.title = title as String
        childerVC.title = title as String

        var norImg = UIImage(named:normalImg as String)
        norImg = norImg?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)

        var selImg = UIImage(named:selectedImg as String)
        selImg = selImg?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)

        let tabItem = UITabBarItem(title: title as String, image: norImg, selectedImage: selImg)

        let naVc = UINavigationController()
        
        naVc.tabBarItem = tabItem
        
        naVc.addChild(childerVC)
        
        self.addChild(naVc)
        
        
    }
    

   

}
