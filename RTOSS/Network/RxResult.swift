//
//  RxResult.swift
//  RTOSS
//
//  Created by isoft on 2019/1/8.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import ObjectMapper

public extension ObservableType {
    public func mapResult() ->Observable<Alamofire.Result<E>> {
        return flatMap
            { Observable.just( Alamofire.Result.success($0)) }
            .catchError { Observable.just( Alamofire.Result.failure($0)) }
    }
}
