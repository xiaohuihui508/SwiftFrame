//
//  DeviceVC.swift
//  RTOSS
//
//  Created by isoft on 2019/1/7.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class DeviceVC: UIViewController {
    
    fileprivate lazy var tableView : UITableView = {[weak self] in
        let tableview = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView.init()
        tableview.backgroundColor = UIColor.white
        tableview.separatorColor = UIColor(hex: "dfdfdf")
        tableview.register(YFNewsCell.self, forCellReuseIdentifier: YFNewsCell.cellIdentifier)
        return tableview
    }()
    
    var  arr = [List]()
    var page:Int = 1
    var columnName = "专题"
    var columnID = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "资讯详情"
        setUI()
        getData()
    }
    

}
//获取数据
extension DeviceVC {
    func getData() {
        _ = RTNetwork.shared.getNewsList(columnName: columnID, page: page, size: 30)
            .map() { json in
                guard let value = json["data"] as? [String : Any] else{
                    throw WSError(code: -1, localizedDescription: "数据格式错误")
                }
                if self.page == 1  {
//                    ESToolAPI.BtnAPI.mSERIALIZE_ARCHIVE(__objToBeArchived__: value, __filePath__: self.columnID)
                }
//                print("%@==",value)
                return value
            }
            .mapObject(type: YFNewsModel.self)
            .subscribe(onNext: { [weak self] (model) in
                
//                if self?.page == 1 {
//                    self?.arr.removeAll()
//                    if model.list?.count == 0 {
////                        self?.emptyView.isHidden = false
//                    }else {
//                        self?.emptyView.isHidden = true
                        self?.arr = model.list ?? [List]()
                        self?.tableView.reloadData()
//                    }
//                }else {
////                    if model.list?.count == 0 {
////                        self?.tableView.mj_footer.endRefreshingWithNoMoreData()
////                    }else {
////                        self?.arr += model.list ?? [List]()
////                        self?.tableView.reloadData()
////                    }
//                }
                }, onError: { [weak self] (error) in
//                    self?.view.showWarning(error.localizedDescription)
                    self?.page = 1
//                    self?.tableView.mj_footer.endRefreshing()
//                    self?.tableView.mj_header.endRefreshing()
                }, onCompleted: {
//                    self.tableView.mj_footer.endRefreshing()
//                    self.tableView.mj_header.endRefreshing()
                    
            })
    }
}
//设置UI
extension DeviceVC {
    
    func setUI() {
        view.addSubview(tableView)
        tableView.snp.updateConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
        }
    }
    
}

extension DeviceVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension DeviceVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:YFNewsCell.cellIdentifier) as! YFNewsCell
//        cell.textLabel?.text = "你好啊"
        let model = self.arr[indexPath.row]
        cell.selectionStyle = .none
        cell.configCellData(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170 * m6Scale
    }
    
}
