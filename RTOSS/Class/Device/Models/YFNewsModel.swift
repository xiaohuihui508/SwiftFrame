//
//  YFNewsModel.swift
//  RTOSS
//
//  Created by isoft on 2019/1/8.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit
import ObjectMapper

class YFNewsModel: NSObject, Mappable{
    var endRow:Int = 0
    var firstPage:Int = 0
    var hasNextPage:Bool = false
    var hasPreviousPage:Bool = false
    var isFirstPage:Bool = false
    var isLastPage:Bool = false
    var lastPage:Int = 0
    var list : [List]?
    var navigateFirstPage:Int = 0
    var navigateLastPage:Int = 0
    var navigatePages:Int = 0
    var navigatepageNums : [Int]?
    var nextPage:Int = 0
    var pageNum:Int = 0
    var pageSize:Int = 0
    var pages:Int = 0
    var prePage:Int = 0
    var size:Int = 0
    var startRow:Int = 0
    var total:Int = 0
    var count:Int = 0
    
    required init?(map: Map){}
    func mapping(map: Map)
    {
        count <- map["count"]
        endRow <- map["endRow"]
        firstPage <- map["firstPage"]
        hasNextPage <- map["hasNextPage"]
        hasPreviousPage <- map["hasPreviousPage"]
        isFirstPage <- map["isFirstPage"]
        isLastPage <- map["isLastPage"]
        lastPage <- map["lastPage"]
        list <- map["sendData"]
        navigateFirstPage <- map["navigateFirstPage"]
        navigateLastPage <- map["navigateLastPage"]
        navigatePages <- map["navigatePages"]
        navigatepageNums <- map["navigatepageNums"]
        nextPage <- map["nextPage"]
        pageNum <- map["pageNum"]
        pageSize <- map["pageSize"]
        pages <- map["pages"]
        prePage <- map["prePage"]
        size <- map["size"]
        startRow <- map["startRow"]
        total <- map["total"]
        
    }
    
}


class List : NSObject, Mappable{
    
    var auditorId:String = ""
    var auditorName:String = ""
    var checkStatus:String = ""
    //    var columnId:String = ""
    //    var columnName:String = ""
    var content:String = ""
    var coverPicUrl:String = ""
    var createdBy:String = ""
    var createdName:String = ""
    var createdTime:Int = 0
    var descriptionField:String = ""
    var discuss:String = ""
    //    var discussCount:Int = 0
    var flag:String = ""
    var id:String = ""
    var isRemove:String = ""
    var keyword:String = ""
    var modifyTime:Int = 0
    var page:Int = 0
    //    var praisCount:Int = 0
    //    var publishTime:Int = 0
    //    var readCount:Int = 0
    var releaseOnline:String = ""
    var rows:Int = 0
    var source:String = ""
    //    var sourceContent:String = ""
    //    var summary:String = ""
    //    var title:String = ""
    var top:String = ""
    
    var appCmsDetailUrlWithNotUp:String  = ""
    var appCmsDetailUrlWithUp:String  = ""
    var articleID:String = ""
    var articleSequenceId:NSNumber = 0
    var backwardChaining:String = ""
    var bigPictureUrl:String = ""
    var columnId:String = ""
    var columnName:String = ""
    var columnSequenceId:String = ""
    var discussCount:String = ""
    var keyWord:String = ""
    var praiseCount:Int = 0
    var publishTime:Int = 0
    var readCount:Int = 0
    var smallPictureUrl:String = ""
    var sourceContent:String = ""
    var sourceFlag:String = ""
    var summary:String = ""
    var title:String = ""
    
    
    
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        appCmsDetailUrlWithNotUp <- map["appCmsDetailUrlWithNotUp"]
        appCmsDetailUrlWithUp <- map["appCmsDetailUrlWithUp"]
        auditorId <- map["auditorId"]
        auditorName <- map["auditorName"]
        checkStatus <- map["checkStatus"]
        //        columnId <- map["columnId"]
        //        columnName <- map["columnName"]
        content <- map["content"]
        coverPicUrl <- map["coverPicUrl"]
        createdBy <- map["createdBy"]
        createdName <- map["createdName"]
        createdTime <- map["createdTime"]
        descriptionField <- map["description"]
        discuss <- map["discuss"]
        //        discussCount <- map["discussCount"]
        flag <- map["flag"]
        id <- map["id"]
        isRemove <- map["isRemove"]
        keyword <- map["keyword"]
        modifyTime <- map["modifyTime"]
        page <- map["page"]
        //        praisCount <- map["praisCount"]
        //        publishTime <- map["publishTime"]
        //        readCount <- map["readCount"]
        releaseOnline <- map["releaseOnline"]
        rows <- map["rows"]
        source <- map["source"]
        //        sourceContent <- map["sourceContent"]
        //        summary <- map["summary"]
        //        title <- map["title"]
        top <- map["top"]
        
        articleID <- map["articleID"]
        articleSequenceId <- map["articleSequenceId"]
        backwardChaining <- map["backwardChaining"]
        bigPictureUrl <- map["bigPictureUrl"]
        columnId <- map["columnId"]
        columnName <- map["columnName"]
        columnSequenceId <- map["columnSequenceId"]
        discussCount <- map["discussCount"]
        keyWord <- map["keyWord"]
        praiseCount <- map["praiseCount"]
        publishTime <- map["publishTime"]
        readCount <- map["readCount"]
        smallPictureUrl <- map["smallPictureUrl"]
        sourceContent <- map["sourceContent"]
        sourceFlag <- map["sourceFlag"]
        summary <- map["summary"]
        title <- map["title"]
        
        
    }
}
