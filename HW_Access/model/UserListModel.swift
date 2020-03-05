//
//  UserListModel.swift
//  HW_Access
//
//  Created by user1 on 2020/3/3.
//  Copyright © 2020 user1. All rights reserved.
//

import Foundation

class UserListModel{
    
    static var sharedInstance : UserListModel?
    var userArr = Array<User>()
    
    static func getInstance() -> UserListModel{
        if UserListModel.sharedInstance == nil{
            UserListModel.sharedInstance = UserListModel()
        }
        return UserListModel.sharedInstance!
    }
}

class User{
    var login : String?
    var id : Int?
    var node_id : String?
    var avatar_url : String?
    var gravatar_id : String?
    var url : String?
    var html_url : String?
    var followers_url : String?
    var following_url : String?
    var gists_url : String?
    var starred_url : String?
    var subscriptions_url : String?
    var organizations_url : String?
    var repos_url : String?
    var events_url : String?
    var received_events_url : String?
    var type : String?
    var site_admin : Bool?
    
    init(login : String?, id : Int?, node_id : String?, avatar_url : String?, gravatar_id : String?, url : String?, html_url : String?, followers_url : String?, following_url : String?, gists_url : String?, starred_url : String?, subscriptions_url : String?, organizations_url : String?, repos_url : String?, events_url : String?, received_events_url : String?, type : String?, site_admin : Bool?){
        self.login = login
        self.id = id
        self.node_id = node_id
        self.avatar_url = avatar_url
        self.gravatar_id = gravatar_id
        self.url = url
        self.html_url = html_url
        self.followers_url = followers_url
        self.following_url = following_url
        self.gists_url = gists_url
        self.starred_url = starred_url
        self.subscriptions_url = subscriptions_url
        self.organizations_url = organizations_url
        self.repos_url = repos_url
        self.events_url = events_url
        self.received_events_url = received_events_url
        self.type = type
        self.site_admin = site_admin
    }
}
