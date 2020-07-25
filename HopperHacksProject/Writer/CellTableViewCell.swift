//
//  CellTableViewCell.swift
//  HopperHacksProject
//
//  Created by Arianna Martinelli on 7/25/20.
//  Copyright © 2020 HopperHacks. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var img: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
