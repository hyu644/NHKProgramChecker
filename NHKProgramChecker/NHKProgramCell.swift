//
//  NHKProgramCell.swift
//  NHKProgramChecker
//
//  Created by hyu on R 2/09/10.
//  Copyright © Reiwa 2 hyu. All rights reserved.
//

import UIKit

class NHKProgramCell: UITableViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
