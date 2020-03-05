//
//  UserListVC.swift
//  HW_Access
//
//  Created by user1 on 2020/3/3.
//  Copyright © 2020 user1. All rights reserved.
//

import UIKit

class UserListVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    static var sharedInstance :UserListVC?
    var ulvm : UserListViewModel?
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userList: UILabel!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserListVC.sharedInstance = self
        UserListViewModel.sharedInstance = UserListViewModel.getInstance()
        ulvm = UserListViewModel.sharedInstance
        ulvm!.getInfoFromAPI(api: "/users")
        setTableView()
    }
    
    func update(){
        tableView.backgroundColor = UIColor.systemGray6
        tableView.reloadData()
        loading.stopAnimating()
//        userList.isHidden = false
        userList.setIsHidden(false, animated: true)
        tableView.setIsHidden(false, animated: true)
    }
    
    func setTableView() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.isHidden = true
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ulvm!.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ulvm!.tableView(tableView, cellForRowAt: indexPath)
    }
}

extension UIView {
    func setIsHidden(_ hidden: Bool, animated: Bool) {
        if animated {
            if self.isHidden && !hidden {
                self.alpha = 0.0
                self.isHidden = false
            }
            UIView.animate(withDuration: 0.5, animations: {
                self.alpha = hidden ? 0.0 : 1.0
            }) { (complete) in
                self.isHidden = hidden
            }
        } else {
            self.isHidden = hidden
        }
    }
}
