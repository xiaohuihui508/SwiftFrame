//
//  RxAlamofireObjectMapper.swift
//  RTOSS
//
//  Created by isoft on 2019/1/8.
//  Copyright © 2019 isoft. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper
import Alamofire

public extension ObservableType where E == [String:Any] {
    
    public func mapObject<T:Mappable>(type:T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            guard let result = Mapper<T>().map(JSON: response) else {
                let error = ObjectMapperError(domain:"ObjectMapper",code:100,message:"JSON转换错误");
                throw error;
            }
            return Observable.just(result);
            
        }
        
    }
    
}

public extension ObservableType where E == [[String: Any]] {
    public func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            let result = Mapper<T>().mapArray(JSONArray:response)
            return Observable.just(result);
        }
    }
}

/**
 *  JSON转换错误
 */
struct ObjectMapperError : Error {
    let domain: String
    let code: Int
    let message: String
    
    var _domain: String {
        return domain
    }
    
    var _code: Int {
        return code
    }
    
    var _message: String {
        return message
    }
}
