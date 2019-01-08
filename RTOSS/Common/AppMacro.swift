//
//  AppMacro.swift
//  RTOSS
//
//  Created by isoft on 2019/1/8.
//  Copyright © 2019 isoft. All rights reserved.
//

import Foundation
import UIKit

//MARK:-- 界面设计相关
let mScreenWidth    = UIScreen.main.bounds.width
let mScreenHeight   = UIScreen.main.bounds.height

let IS_IPHONE_X  = mScreenHeight == 812 ? true : false
let IS_IPHONE_XS = mScreenHeight == 896 ? true : false
let navH = ((IS_IPHONE_X || IS_IPHONE_XS) ? 88 : 64)
let statusBar = ((IS_IPHONE_X || IS_IPHONE_XS) ? 24 : 0)
let BottomHeight = ((IS_IPHONE_X || IS_IPHONE_XS) ? 34 : 0)
let TopNavHeight = ((IS_IPHONE_X || IS_IPHONE_XS) ? 44 : 24)

/// MARK:- 按屏幕缩放比例
let m5Scale             = (mScreenWidth/640.0)
let m6Scale             = (mScreenWidth/750.0)
let m6PScale            = (mScreenWidth/1242.0)
let k6Scale             = (mScreenWidth/375.0)


///MARK:APP基本色=========
let KBottomBgColoe = UIColor(hex: "ffffff")
let KConfigColor   = UIColor(hex: "27b0e1")
let KBlackColor    = UIColor(hex: "333333")
