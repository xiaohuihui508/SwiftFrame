//
//  MessageVC.swift
//  RTOSS
//
//  Created by isoft on 2019/1/9.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class MessageVC: UIViewController {
    
    fileprivate lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: mScreenWidth-32, height: 154)
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 16, right: 10)
       let collectionview = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.backgroundColor = UIColor(hex: "eaeaea")
        collectionview.register(MessageCollectionViewCell.self, forCellWithReuseIdentifier: MessageCollectionViewCell.cellIdentifier)
        return collectionview
    }()
    
    var tagArray = [MessageModel]()
    var selectArray = [MessageModel]()
    var array:[String] = ["系统消息1", "系统消息2", "系统消息3", "系统消息4", "系统消息5", "系统消息6", "系统消息7", "系统消息8", "系统消息9", "系统消息10", "系统消息11"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(hex: "eaeaea")
        
        self.navigationItem.title = "消息中心"
        setUI()
        
        for str in array {
            let model = MessageModel.init()
            model.name = str
            model.isSelect = 0
            self.tagArray.append(model)
        }
        collectionView.reloadData()
    }
    
}

extension MessageVC {
    func setUI() {
        view.addSubview(collectionView)
        collectionView.snp.updateConstraints { (make) in
            make.edges.equalTo(0)
        }
        
    }
}

extension MessageVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageCollectionViewCell.cellIdentifier, for: indexPath) as! MessageCollectionViewCell
        let model = tagArray[indexPath.item]
        cell.config(model:model)
        return cell
    }
}

extension MessageVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let model = tagArray[indexPath.item]
        if model.isSelect == 1 {
            model.isSelect = 0
            self.selectArray.append(model)
        } else {
            model.isSelect = 1
            self.selectArray.append(model)
        }
       
        collectionView.reloadData()
    }
}
