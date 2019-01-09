//
//  MineHeaderView.swift
//  RTOSS
//
//  Created by isoft on 2019/1/9.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class MineHeaderView: UIView {
    
    let headerImg : UIImageView = {
       let img = UIImageView()
        img.backgroundColor = UIColor.purple
        img.layer.cornerRadius = 35.0
        img.layer.masksToBounds = true
        return img
    }()
    
    let nameLB : UILabel = {
       let label = UILabel()
        label.font = kAppFont(fontName: .regular, fontSize: 18)
        label.textColor = KBlackColor
        label.text = "测试一波"
        return label
    }()
    
    let arrImg : UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "arrow_w_n")
        return img
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = KConfigColor
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MineHeaderView {
    
    func setUI() {
        self.addSubview(headerImg)
        self.addSubview(nameLB)
        self.addSubview(arrImg)
        
        headerImg.snp.updateConstraints { (make) in
            make.bottom.equalTo(-26)
            make.width.height.equalTo(70)
            make.left.equalTo(16)
        }
        
        nameLB.snp.updateConstraints { (make) in
            make.centerY.equalTo(headerImg.snp.centerY)
            make.left.equalTo(headerImg.snp.right).offset(10)
            make.right.equalTo(-30)
            make.height.equalTo(22)
        }
        
        arrImg.snp.updateConstraints { (make) in
            make.centerY.equalTo(headerImg.snp.centerY)
            make.right.equalTo(-16)
            make.width.equalTo(10)
            make.height.equalTo(14)
        }
        
    }
    
}
