//
//  ReceiveTableViewCell.swift
//  HopperHacksProject
//
//  Created by Eugenia Feng on 7/25/20.
//  Copyright © 2020 HopperHacks. All rights reserved.
//

import UIKit

class ReceiveTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var messagePreview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
