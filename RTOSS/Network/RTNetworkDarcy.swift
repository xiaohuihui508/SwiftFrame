//
//  RTNetworkDarcy.swift
//  RTOSS
//
//  Created by isoft on 2019/1/8.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire
import SwiftyJSON

extension RTNetwork {
    
    //资讯列表
    func getNewsList(columnName:String,page:Int,size:Int)->Observable<[String:Any]> {
        let urlStr = "/article/findArticleListByColumn.json"
        let jsonParam = ["columnId":columnName] as [String : Any]
        let parms = ["jsonParam":jsonParam,
                     "page":page,
                     "rows":size
            ] as [String : Any]
        
        return post(urlStr, parms)
    }
    
}
