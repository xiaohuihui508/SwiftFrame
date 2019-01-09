//
//  MineViewCell.swift
//  RTOSS
//
//  Created by isoft on 2019/1/9.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class MineViewCell: UITableViewCell {
    
    static let cellIdenifier = "MineViewCell"
    
    let iconImg : UIImageView = {
       let img = UIImageView()
//        img.backgroundColor = UIColor.purple
        return img;
    }()
    
    let titleLB : UILabel = {
       let label = UILabel()
        label.textColor = KBlackColor
        label.text = "测试"
        label.font = kAppFont(fontName: .regular, fontSize: 15)
        return label
    }()
    
    let redNumLB : UILabel = {
       let label = UILabel()
        label.layer.cornerRadius = 7;
        label.layer.masksToBounds = true
        label.backgroundColor = .red
        label.text = "5"
        label.textColor = UIColor(hex: "ffffff")
        label.textAlignment = NSTextAlignment.center
        label.font = kAppFont(fontName: .regular, fontSize: 12)
        return label
    }()
    
    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "dfdfdf")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        setUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension MineViewCell {
    func setUI() {
        contentView.addSubview(iconImg)
        contentView.addSubview(titleLB)
        contentView.addSubview(redNumLB)
        contentView.addSubview(lineView)
        
        iconImg.snp.updateConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY)
            make.left.equalTo(18)
            make.width.height.equalTo(20)
        }
        
        titleLB.snp.updateConstraints { (make) in
            make.centerY.equalTo(iconImg.snp.centerY)
            make.left.equalTo(iconImg.snp.right).offset(10)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }
        
        redNumLB.snp.updateConstraints { (make) in
            make.centerY.equalTo(iconImg.snp.centerY)
            make.right.equalTo(-18)
            make.width.height.equalTo(14)
        }
        
        lineView.snp.updateConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.top.equalTo(59)
            make.height.equalTo(1)
        }
        
    }
}
