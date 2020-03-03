//
//  DetailCell.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/24/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var descriptionLabel: UILabel?
    @IBOutlet var linkButton: UIButton?
    @IBOutlet var separatorView: UIView?
    @IBOutlet var linkButtonHeightConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        super.setSelected(false, animated: animated)
    }

    //MARK: - Function
    func populateCellWith(name: String?, description: String?, link: String?) {
        self.nameLabel?.text = name
        self.descriptionLabel?.text = description
        self.linkButton?.isHidden = (link?.isEmpty ?? true) ? true : false
        self.linkButtonHeightConstraint.isActive = (link?.isEmpty ?? true) ? true : false
        self.linkButton?.setTitle(link, for: .normal)
    }
}
