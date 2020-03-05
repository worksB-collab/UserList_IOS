//
//  TableViewCell.swift
//  HW_Access
//
//  Created by user1 on 2020/3/4.
//  Copyright © 2020 user1. All rights reserved.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {

    @IBOutlet weak var avatar_url: UIImageView!
    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var site_admin: UILabel!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setRoundedLabel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRoundedLabel(){
        site_admin.backgroundColor  = UIColor.purple
        site_admin.layer.cornerRadius = 5
    }
    
    func setRoundedImage(){
        avatar_url.layer.borderWidth = 1.0
        avatar_url.layer.masksToBounds = false
        avatar_url.layer.borderColor = UIColor.white.cgColor
        avatar_url.layer.cornerRadius = avatar_url.frame.size.width / 2
        avatar_url.clipsToBounds = true
    }
    
    class var reuseIdentifier: String {
        return "TableViewCell"
    }
    
    class var nibName: String {
        return "TableViewCell"
    }
    
    func configureCell(avatar_url: String, login: String, site_admin: Bool) {
        setRoundedImage()
        let url = URL(string: avatar_url)
        self.avatar_url?.kf.setImage(with: url)
        self.login?.text = login
        if !site_admin{
            self.site_admin.isHidden = true
            self.login.removeConstraint(topConstraint)
            self.login.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        }
    }
}
