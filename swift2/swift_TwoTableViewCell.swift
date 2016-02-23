//
//  swift_TwoTableViewCell.swift
//  swift2
//
//  Created by junashi on 16/2/19.
//  Copyright © 2016年 junashi. All rights reserved.
//

import UIKit

class swift_TwoTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func clickAction(sender: AnyObject) {
        print("好好上班！抽什么奖啊？");
    }
    
}
