//
//  UerListViewModel.swift
//  HW_Access
//
//  Created by user1 on 2020/3/3.
//  Copyright © 2020 user1. All rights reserved.
//

import UIKit
import Foundation

class UserListViewModel{
    
    let ulm : UserListModel?
    let ulvc : UserListVC?
    
    static var sharedInstance : UserListViewModel?
    
    init(){
        UserListModel.sharedInstance = UserListModel.getInstance()
        ulm = UserListModel.sharedInstance
        ulvc = UserListVC.sharedInstance
    }
    
    func getInfoFromAPI(api : String){
        NetWorkController.sharedInstance.get(api: api)
        {(jsonData) in
            let jd = jsonData.array
            for i in jd!{
                let user = User(login: i["login"].string, id: i["id"].int, node_id: i["login"].string, avatar_url: i["avatar_url"].string, gravatar_id: i["gravatar_id"].string, url: i["url"].string, html_url: i["html_url"].string, followers_url: i["followers_url"].string, following_url: i["following_url"].string, gists_url: i["gists_url"].string, starred_url: i["starred_url"].string, subscriptions_url: i["subscriptions_url"].string, organizations_url: i["organizations_url"].string, repos_url: i["repos_url"].string, events_url: i["events_url"].string, received_events_url: i["received_events_url"].string, type: i["type"].string, site_admin: i["site_admin"].bool)
                self.ulm!.userArr.append(user)
            }
            self.ulvc?.update()
        }
    }
    
    static func getInstance() -> UserListViewModel{
        if UserListViewModel.sharedInstance == nil{
            UserListViewModel.sharedInstance = UserListViewModel()
        }
        return UserListViewModel.sharedInstance!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ulm!.userArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.configureCell(avatar_url: ulm!.userArr[indexPath.item].avatar_url!, login: ulm!.userArr[indexPath.item].login!, site_admin: ulm!.userArr[indexPath.item].site_admin!)
      return cell
    }
}
