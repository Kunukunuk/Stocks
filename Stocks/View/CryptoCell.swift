//
//  CryptoCell.swift
//  Stocks
//
//  Created by Kun Huang on 12/12/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class CryptoCell: UITableViewCell {
    
    @IBOutlet weak var companySymbolLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var closeLabel: UILabel!
    @IBOutlet weak var previousCloseLabel: UILabel!
    @IBOutlet weak var latestPriceLabel: UILabel!
    @IBOutlet weak var latestVolumeLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var askPriceLabel: UILabel!
    @IBOutlet weak var bidPriceLabel: UILabel!
    @IBOutlet weak var askSizeLabel: UILabel!
    @IBOutlet weak var bidSizeLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var changePercentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
