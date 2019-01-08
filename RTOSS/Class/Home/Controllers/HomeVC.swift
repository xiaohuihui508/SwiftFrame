//
//  HomeVC.swift
//  RTOSS
//
//  Created by isoft on 2019/1/7.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUI()
        
    }
    
    func setUI(){
        
        let titleLB = UILabel()
        titleLB.backgroundColor = .red
        view.addSubview(titleLB)
        titleLB.snp.updateConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(100)
            make.height.equalTo(150)
        }
        
    }
   

}
