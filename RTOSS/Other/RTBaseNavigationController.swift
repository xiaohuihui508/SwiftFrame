//
//  RTBaseNavigationController.swift
//  RTOSS
//
//  Created by isoft on 2019/1/9.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class RTBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            let backBtn = UIButton(type: UIButton.ButtonType.custom)
            backBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 44)
            backBtn.setImage(UIImage(named: "head_nav_back"), for: UIControl.State.normal)
            backBtn.addTarget(self, action: #selector(backButton), for: UIControl.Event.touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backBtn)
        }
        
    }
    
    @objc func backButton(sender:UIButton) {
        self.popViewController(animated: true)
    }

}
