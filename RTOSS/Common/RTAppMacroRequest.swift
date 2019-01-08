//
//  RTAppMacroRequest.swift
//  RTOSS
//
//  Created by isoft on 2019/1/8.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class RTAppMacroRequest: NSObject {
    @objc static let share = RTAppMacroRequest()
    
    @objc func getHostSiteMain()->String {
        return N_HostSiteMain
    }

}
