//
//  UserInfoHearderView.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/24/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

class UserInfoHearderView: UITableViewHeaderFooterView {

    //MARK: - IBOutlet
    @IBOutlet var avatarImageView: UIImageView?
    @IBOutlet var userNameLabel: UILabel?
    @IBOutlet var publicReposTitleLabel: UILabel?
    @IBOutlet var publicReposValueLabel: UILabel?
    @IBOutlet var publicGistTitleLabel: UILabel?
    @IBOutlet var publicGistValueLabel: UILabel?
    @IBOutlet var followersTitleLabel: UILabel?
    @IBOutlet var followersValueLabel: UILabel?
    @IBOutlet var followingTitleLabel: UILabel?
    @IBOutlet var followingValueLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView?.layer.cornerRadius = 70
    }

    //MARK: - Functions
    func populate(userInfo info : User?) {
        avatarImageView?.downloaded(from: info?.avatar_url ?? "")
        userNameLabel?.text = info?.name
        publicReposValueLabel?.text = "\(info?.public_repos ?? 0)"
        publicGistValueLabel?.text = "\(info?.public_gists ?? 0)"
        followersValueLabel?.text = "\(info?.followers ?? 0)"
        followingValueLabel?.text = "\(info?.following ?? 0)"
    }
}
