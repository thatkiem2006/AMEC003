//
//  cellTips.swift
//  amecApp003
//
//  Created by linhth on 10/20/17.
//  Copyright © 2017 adv. All rights reserved.
//

import UIKit

class cellTips: UITableViewCell {
    
    @IBOutlet weak var _img: UIImageView!
    @IBOutlet weak var _lbl1: UILabel!
    @IBOutlet weak var _lbl2: UILabel!
    @IBOutlet weak var _viewCell: UIView!
    @IBOutlet weak var _viewLine: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
