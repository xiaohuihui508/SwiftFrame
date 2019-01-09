//
//  MessageCollectionViewCell.swift
//  RTOSS
//
//  Created by isoft on 2019/1/9.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class MessageCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "MessageCollectionViewCell"
    
    let readImg : UIImageView = {
       let img = UIImageView()
//        img.image = UIImage(named: "unread_n")
        return img
    }()
    
   @objc let titleLB : UILabel = {
       let label = UILabel()
        label.font = kAppFont(fontName: .regular, fontSize: 14)
        label.text = "系统消息"
        label.textColor = KBlackColor
        return label
    }()
    
    let timeLB : UILabel = {
       let label = UILabel()
        label.font = kAppFont(fontName: .regular, fontSize: 12)
        label.text = "2019-1-9 14:25:12"
        label.textColor = UIColor(hex: "999999")
        return label
    }()
    
    let contentLB : UILabel = {
        let label = UILabel()
        label.font = kAppFont(fontName: .regular, fontSize: 12)
        label.textColor = UIColor(hex: "666666")
        label.text = "通知标题通知内容之类的东西通知标题通知内容之类的东西通知标题通知内容之类的东西"
        label.numberOfLines = 0
        return label
    }()
    
    let lineView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(hex: "f0f0f0")
        return view
    }()
    
    let lookView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "ffffff")
        return view
    }()
    
    let lookLB : UILabel = {
       let label = UILabel()
        label.text = "查看详情 >"
        label.textColor = UIColor(hex: "666666")
        label.font = kAppFont(fontName: .regular, fontSize: 13)
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(hex: "ffffff")
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MessageCollectionViewCell {
    
    func setUI() {
        
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        
        contentView.addSubview(readImg)
        contentView.addSubview(timeLB)
        contentView.addSubview(titleLB)
        contentView.addSubview(contentLB)
        contentView.addSubview(lineView)
        contentView.addSubview(lookView)
        lookView.addSubview(lookLB)
        
        readImg.snp.updateConstraints { (make) in
            make.top.right.equalTo(0)
            make.width.height.equalTo(50)
        }
        
        titleLB.snp.updateConstraints { (make) in
            make.left.top.equalTo(10)
            make.height.equalTo(16)
            make.width.equalTo(mScreenWidth-32-20)
        }
        
        timeLB.snp.updateConstraints { (make) in
            make.left.equalTo(titleLB.snp.left)
            make.top.equalTo(titleLB.snp.bottom).offset(8)
            make.height.equalTo(14)
            make.width.equalTo(titleLB.snp.width)
        }
        
        contentLB.snp.updateConstraints { (make) in
            make.left.equalTo(titleLB.snp.left)
            make.top.equalTo(timeLB.snp.bottom).offset(12)
            make.height.equalTo(35)
            make.width.equalTo(titleLB.snp.width)
        }
        
        lineView.snp.updateConstraints { (make) in
            make.left.right.equalTo(0)
            make.height.equalTo(1)
            make.top.equalTo(contentLB.snp.bottom).offset(18)
        }
        
        lookView.snp.updateConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(lineView.snp.bottom)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        
        lookLB.snp.updateConstraints { (make) in
            make.centerX.equalTo(lookView.snp.centerX)
            make.centerY.equalTo(lookView.snp.centerY)
            make.height.equalTo(18)
        }
        
        
    }
    
//    open func configCellData(title:String, select:Int) {
//        
//        titleLB.text = title
//        if select == 0  {
//            readImg.image = UIImage(named: "unread_n")
//        } else {
//            readImg.image = UIImage(named: "read_n")
//        }
//    
//    }
    
    open func config(model:MessageModel) {
        
        titleLB.text = model.name
        if model.isSelect == 0  {
            readImg.image = UIImage(named: "unread_n")
        } else {
            readImg.image = UIImage(named: "read_n")
        }
        
    }
}
