//
//  RegionCell.swift
//  ZazendTest
//
//  Created by Sasha on 2/7/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

class RegionCell: UITableViewCell {
    
    @IBOutlet weak var regionNameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(region: String) {
        self.regionNameLabel.text = region
    }
    
}
