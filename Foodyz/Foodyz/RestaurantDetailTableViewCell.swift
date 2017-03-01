//
//  RestaurantDetailTableViewCell.swift
//  Foodyz
//
//  Created by Stephen Lin on 2/24/17.
//  Copyright © 2017 Stephen Lin. All rights reserved.
//

import UIKit

class RestaurantDetailTableViewCell: UITableViewCell {
    
    @IBOutlet var fieldLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
