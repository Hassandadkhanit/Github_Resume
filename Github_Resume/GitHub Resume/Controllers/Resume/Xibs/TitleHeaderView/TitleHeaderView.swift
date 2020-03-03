//
//  TitleHeaderView.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/24/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

class TitleHeaderView: UITableViewHeaderFooterView {
    
    //MARK: - IBOutlet
    @IBOutlet var titleLabel: UILabel?
    
    //MARK: - Functions
    func setTitle(_ title: String?) {
        titleLabel?.text = title
    }
    
}
