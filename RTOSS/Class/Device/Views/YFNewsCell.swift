//
//  YFNewsCell.swift
//  RTOSS
//
//  Created by isoft on 2019/1/8.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit
import Kingfisher

class YFNewsCell: UITableViewCell {

    static let cellIdentifier = "kYFNewsCell"
    
    let coverIV: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = KBlackColor
        label.font = kAppFont(fontName: .regular, fontSize: 16)
        label.backgroundColor = UIColor.black.alpha(0)
        label.textAlignment = .left
        
        return label
    }()
    
    let desLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "999999")
        label.font = kAppFont(fontName: .regular, fontSize: 12)
        label.backgroundColor = UIColor.black.alpha(0)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let coverIV1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.init(named: "时间")
        return imageView
    }()
    let desLabel1: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "999999")
        label.font = kAppFont(fontName: .regular, fontSize: 12)
        label.backgroundColor = UIColor.black.alpha(0)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let coverIV2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.init(named: "阅读人数")
        return imageView
    }()
    let desLabel2: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "999999")
        label.font = kAppFont(fontName: .regular, fontSize: 12)
        label.backgroundColor = UIColor.black.alpha(0)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let coverIV3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.init(named: "评论")
        return imageView
    }()
    let desLabel3: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "999999")
        label.font = kAppFont(fontName: .regular, fontSize: 12)
        label.backgroundColor = UIColor.black.alpha(0)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none;
        setUI()
        self.backgroundColor = UIColor(hex:"ffffff")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

extension YFNewsCell {
    
    func setUI() {
        contentView.addSubview(coverIV)
        contentView.addSubview(titleLabel)
        let h = 30 * m6Scale
        let w = 30 * m6Scale
        coverIV.snp.updateConstraints { (make) in
            make.left.equalToSuperview().offset(h)
            make.top.equalToSuperview().offset(h)
            make.bottom.equalToSuperview().offset(-h)
            make.width.equalTo(192 * m6Scale)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.coverIV.snp.right).offset(h)
            make.right.equalToSuperview().offset(-5)
            make.top.equalToSuperview().offset(h-2)
            make.height.equalTo(18);
        }
        contentView.addSubview(desLabel)
        desLabel.isHidden = true
        desLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.coverIV.snp.right).offset(h)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(8)
            make.right.equalTo(self.contentView).offset(-10)
            make.bottom.equalTo(self.contentView).offset(-44 * m6Scale)
        }
        
        contentView.addSubview(coverIV1)
        coverIV1.snp.updateConstraints { (make) in
            make.left.equalTo(self.coverIV.snp.right).offset(h)
            make.centerY.equalTo(self.desLabel.snp.centerY).offset(0)
            make.width.equalTo(w)
            make.height.equalTo(h)
        }
        
        contentView.addSubview(desLabel1)
        desLabel1.snp.makeConstraints { (make) in
            make.left.equalTo(self.coverIV1.snp.right).offset(5)
            make.centerY.equalTo(self.desLabel.snp.centerY).offset(0)
        }
        
        
        contentView.addSubview(coverIV2)
        coverIV2.snp.updateConstraints { (make) in
            make.left.equalTo(self.desLabel1.snp.right).offset(48 * m6Scale)
            make.centerY.equalTo(self.desLabel.snp.centerY).offset(0)
            make.width.equalTo(w)
            make.height.equalTo(h)
        }
        
        contentView.addSubview(desLabel2)
        desLabel2.snp.makeConstraints { (make) in
            make.left.equalTo(self.coverIV2.snp.right).offset(5)
            make.centerY.equalTo(self.desLabel.snp.centerY).offset(0)
        }
        
        
        
        contentView.addSubview(coverIV3)
        coverIV3.snp.updateConstraints { (make) in
            make.left.equalTo(self.desLabel2.snp.right).offset(48 * m6Scale)
            make.centerY.equalTo(self.desLabel.snp.centerY).offset(0)
            make.width.equalTo(w)
            make.height.equalTo(h)
        }
        
        contentView.addSubview(desLabel3)
        desLabel3.snp.makeConstraints { (make) in
            make.left.equalTo(self.coverIV3.snp.right).offset(5)
            make.centerY.equalTo(self.desLabel.snp.centerY).offset(0)
        }
        
    }
    
    open func configCellData(_ model:List) {
        coverIV.kf.setImage(with: URL(string:  model.smallPictureUrl), placeholder: kPlaceholderImage)
        let s = String(format:"%ld",model.publishTime)
        print("\(model.discussCount)===")
//        let strs =  YFFlieTool.getDateString(withTimeStr: s, formattStr: "YYYY-MM-dd")
//        desLabel1.text = String(format:"%@",strs ?? "-")
        desLabel.text = String(format: "%@", s)
        
        desLabel2.text = String(format:"%ld",model.readCount)
        
        desLabel3.text = String(format:"%@",model.discussCount)
        //        desLabel.text = String(format:"时间:%@  阅读:%ld  评论:%ld",strs ?? "-",model.readCount,model.discussCount)
        //        let paraph = NSMutableParagraphStyle()
        //        //将行间距设置为28
        //        paraph.lineSpacing = 10*m6Scale
        //        //样式属性集合
        //        let attributes = [NSAttributedStringKey.font:kAppFont(fontSize: 16),
        //                          NSAttributedStringKey.paragraphStyle: paraph]
        //        self.titleLabel.attributedText = NSAttributedString(string: String(format:"%@",model.title), attributes: attributes)
        titleLabel.text = String(format:"%@",model.title)
    }
    
}
