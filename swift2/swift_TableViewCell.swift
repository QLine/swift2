//
//  swift_TableViewCell.swift
//  swift2
//
//  Created by junashi on 16/2/19.
//  Copyright © 2016年 junashi. All rights reserved.
//

import UIKit

class swift_TableViewCell: UITableViewCell {
    @IBOutlet weak var test_Lable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setMyLableValue(lableText:String){
        self.test_Lable.text = lableText;
    }
}
