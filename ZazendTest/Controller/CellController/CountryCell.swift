//
//  CountryCell.swift
//  ZazendTest
//
//  Created by Sasha on 2/7/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var countryFlagLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryNativeNameLabel: UILabel!
    
    // MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Setup Cell
    
    func setupCell(flag: String, countryName: String, countryNativeName: String) {
        self.countryFlagLabel.text = flag.emojiFlag()
        self.countryNameLabel.text = countryName
        self.countryNativeNameLabel.text = countryNativeName
    }
}
