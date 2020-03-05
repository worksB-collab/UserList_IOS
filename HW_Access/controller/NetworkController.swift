//
//  NetworkController.swift
//  HW_Access
//
//  Created by user1 on 2020/3/3.
//  Copyright © 2020 user1. All rights reserved.
//
import Foundation
import SwiftyJSON
import Alamofire

class NetWorkController: NSObject {
    
    static let rootUrl : String = "https://api.github.com"
//    static let listUrl : String = "https://api.github.com/users?since=135"
//    static let paginationUrl : String = "https://api.github.com/user/repos?page=3&per_page=100"
    
    static let sharedInstance = NetWorkController()
    
    var alamofireManager = AF
    
    fileprivate override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 20
        
    }
    
    func get(api : String, callBack:((JSON) -> ())?){
        alamofireManager.request(NetWorkController.rootUrl + api, encoding: JSONEncoding.default, headers: [:]).validate(statusCode: 200 ..< 500).responseJSON
            {
                (response) in
                let jsonData = try! JSON(data: response.data!)
                callBack?(jsonData)
        }
    }
    
}
