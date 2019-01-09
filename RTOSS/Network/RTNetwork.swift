//
//  RTNetwork.swift
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

class RTNetwork: NSObject {
    //创建单例
    static let shared = RTNetwork()
    let manager = SessionManager.default

}

extension RTNetwork {
    
    func json(_ method: Alamofire.HTTPMethod,
              _ url: String,
              parameters: [String: Any]? = nil,
              encoding: ParameterEncoding = JSONEncoding.default,
              headers: [String: String]? = nil
        )
        -> Observable<[String: Any]>
    {
        
        let urlString = urlHandle(url)
        print("==%@",urlString);
        print("==%@",parameters);
        var newParams: [String: Any]?
        switch method {
        case .put, .delete:
            newParams = parameters
        default:
            newParams = paramsHandle(parameters)
        }
        
        return manager
            .rx
            .json(method,
                  urlString,
                  parameters: newParams,
                  encoding:encoding,
                  headers: nil
            )
            .map(){ [unowned self] response in
                print("==\(response)")
                let handleResponse = try self.responseHandle(response: response)
                return handleResponse
            }
            .catchError(){ [unowned self] error in
                let handleError = self.errorHandle(error)
                return Observable.error(handleError)
            }
            .debug()
            .observeOn(MainScheduler.instance)
    }
}
extension RTNetwork {
    
    //获取token
    //-Returns :Token
    func getTokenHandle() -> String {
        
        if let token = UserDefaults.standard.string(forKey: "") {
            return token
        } else {
            let token = UUID().uuidString
            UserDefaults.standard.set(token, forKey: "")
            
            return token
        }
    }
    
    /// URL预处理
    ///
    /// - Parameter url: 原始URL
    /// - Returns: 新的URL
    fileprivate func urlHandle(_ url: String) -> String {
        var urlString = url
        if !url.hasPrefix("http") {
            urlString = N_HostSiteMain + url
        }
        
        return urlString
    }
    
    /// 传参预处理
    /// 默认加入Token
    /// - Parameter params: 处理之前的参数
    /// - Returns: 处理之后的参数
    fileprivate func paramsHandle(_ params: [String : Any]?) -> [String : Any] {
        let newParams = params ?? [String: Any]()
        // newParams["Token"] = getTokenHandle()
        
        
        return newParams
    }
    
    /// 返回结果处理 
    ///
    /// - Parameter response: 原始的返回结果
    /// - Returns: 处理之后的返回结果
    /// - Throws: 异常Error
    fileprivate func responseHandle(response: Any) throws -> [String: Any] {
        var jsonObject = response
        if let value = response as? String {
            guard let str = getDictionaryFromJSONString(jsonString:value ) as? [String : Any] else {
                throw WSError(code: -1, localizedDescription: "服务器开小差儿了，请稍后重试")
            }
            jsonObject = str
        }
        
        
        
        let swiftyJsonObject = JSON(jsonObject)
        
        let status = swiftyJsonObject["e"]["code"]
        let errorStr = swiftyJsonObject["e"]["desc"].stringValue
        
        let status2 = swiftyJsonObject["success"].boolValue;
        let errorStr2 = swiftyJsonObject["message"].stringValue
        
        var des = "请求数据失败"
        
        if errorStr == "" && errorStr2 != "" {
            des = errorStr2
        }else  if errorStr != "" && errorStr2 == "" {
            des = errorStr
        }
        
        
        if status.intValue == 0 {
            
            
        } else {
            if status2 {}else{
                throw WSError(code:-1, localizedDescription: des)
            }
            
            throw WSError(code: status.intValue, localizedDescription:des)
            
        }
        
        
        return jsonObject as! [String : Any]
    }
    //Json字符串转字典
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
    
    //Json字符串转字典
    func getDictionaryFromJSONString2(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        let dic = ["data":dict]
        
        if dict != nil {
            return dic as! NSDictionary
        }
        return NSDictionary()
    }
    
    fileprivate func errorHandle(_ error: Error) -> Error {
        if let localError = error as? AFError {
            if localError.responseCode == 100000 {
                return WSError(code: localError.responseCode ?? 400, localizedDescription: "服务器开小差儿了，请重试")
            }
        }
        return error
    }
    
}

extension RTNetwork {
    
    /// Get请求
    ///
    /// - Parameters:
    ///   - urlString:  完整的URL地址
    ///   - params:     参数
    /// - Returns:      Rx可订阅对象
    
    func get(_ urlString: String,
             _ params: [String : Any]? = nil) -> Observable<[String: Any]> {
        return self.json(.get, urlString, parameters: params, encoding: URLEncoding.default)
    }
    
    /// Post请求
    /// - Parameters:
    ///   - urlString:  请求的Url字符串，支持完整地址
    ///   - params:     请求的参数信息，默认为nil
    /// - Returns:      Rx可订阅对象，[String: Any]类型
    func post(_ urlString: String, _ params: [String : Any]? = nil) -> Observable<[String: Any]> {
        return self.json(.post, urlString, parameters: params)
    }
    
    /// Post请求
    /// - Parameters:
    ///   - urlString:  请求的Url字符串，支持完整地址
    ///   - params:     请求的参数信息，默认为nil
    /// - Returns:      Rx可订阅对象，[String: Any]类型
    func put(_ urlString: String, _ params: [String : Any]? = nil) -> Observable<[String: Any]> {
        return self.json(.put, urlString, parameters: params)
    }
    
    
    /// delete请求
    /// - Parameters:
    ///   - urlString:  请求的Url字符串，支持完整地址
    ///   - params:     请求的参数信息，默认为nil
    /// - Returns:      Rx可订阅对象，[String: Any]类型
    func delete(_ urlString: String,_ params: [String : Any]? = nil) -> Observable<[String: Any]> {
        return self.json(.delete, urlString, parameters: params, encoding: URLEncoding.default)
    }
    
    /// 上传请求
    ///
    /// - Parameters:
    ///   - urlString: 上传地址
    ///   - data: 上传的二进制数据
    /// - Return s: Rx可订阅对象
    func upload(_ urlString: String, data: Data) -> Observable<UploadRequest> {
        return manager
            .rx
            .upload(data, urlRequest: try! RxAlamofire.urlRequest(.get, ""))
            .observeOn(MainScheduler.instance)
    }
    
}

class WSError: NSError {
    
}

extension NSError {
    
    convenience init(code: Int, localizedDescription: String) {
        self.init(domain: localizedDescription, code: code, userInfo: [NSLocalizedDescriptionKey: localizedDescription])
    }
}
