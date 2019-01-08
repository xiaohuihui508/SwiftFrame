//
//  AppConfig.swift
//  RTOSS
//
//  Created by isoft on 2019/1/8.
//  Copyright © 2019 isoft. All rights reserved.
//

import Foundation
import SnapKit
import SwiftyJSON
import SwiftDate
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire
import Hue
import ObjectMapper

//MARK:占位图
let kPlaceholderImage = UIImage(named: "占位图")

//MARK:网络请求主站点
#if DEBUG
//预发布
let N_HostSiteMain = "http://39.107.74.82:36080/jsyf-sys"

#else
//真实环境(勿动)
let N_HostSiteMain = "http://47.93.176.227:36080/jsyf-sys"

#endif

//MARK: 程序字体
enum kAppFontNameType: String{
    case regular    = "PingFangSC-Regular"
    case semibold   = "PingFangSC-Semibold"
    case ultralight = "PingFangSC-Ultralight"
    case thin       = "PingFangSC-Thin"
    case light      = "PingFangSC-Light"
    case medium     = "PingFangSC-Medium"
    case helvetica  = "Helvetica neue"
    
}

/// 快速创建PingFangSC字体，兼容iOS9以下系统
///
/// - Parameters:
///   - fontName: 字体名称 kAppFontNameType
///   - fontSize: 字号
/// - Returns: UIFont类型
func kAppFont(fontName: kAppFontNameType = .regular, fontSize: CGFloat = 17) -> UIFont {
    if let appFont = UIFont(name: fontName.rawValue, size: fontSize) {
        return appFont
    } else {
        switch fontName {
        case .regular:
            return UIFont.systemFont(ofSize: fontSize)
        case .semibold:
            return UIFont.boldSystemFont(ofSize: fontSize)
        case .ultralight:
            return UIFont.italicSystemFont(ofSize: fontSize)
        default:
            return UIFont.systemFont(ofSize: fontSize)
        }
    }
    
}



