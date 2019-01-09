//
//  MineVC.swift
//  RTOSS
//
//  Created by isoft on 2019/1/7.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class MineVC: UIViewController {
    
    fileprivate lazy var tableView : UITableView = {[weak self] in
        let tableview = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = UIColor(hex: "ffffff")
        tableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableview.register(MineViewCell.self, forCellReuseIdentifier: MineViewCell.cellIdenifier)
        return tableview
    }()
    
    var arr:[String] = ["消息通知", "意见反馈", "设置中心"]
    var imgArr:[String] = ["mess_n", "feed_n", "set_n"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
    }

}

extension MineVC {
    func setUI() {
        view.addSubview(tableView)
        tableView.snp.updateConstraints { (make) in
            make.top.equalTo(-TopNavHeight)
            make.left.right.bottom.equalTo(0)
        }
        
        let headerView = MineHeaderView.init(frame: CGRect(x: 0, y: 0, width: mScreenWidth, height: mScreenWidth*0.42))
        tableView.tableHeaderView = headerView
        
    }
}

extension MineVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MineViewCell.cellIdenifier) as! MineViewCell
        cell.titleLB.text = arr[indexPath.row]
        cell.iconImg.image = UIImage(named: imgArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension MineVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = MessageVC()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
