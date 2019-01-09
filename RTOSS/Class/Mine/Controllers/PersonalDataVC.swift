//
//  PersonalDataVC.swift
//  RTOSS
//
//  Created by isoft on 2019/1/9.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class PersonalDataVC: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .red
        self.navigationItem.title = "个人资料"
        
    }
    

}
