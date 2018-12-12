//
//  IPOCell.swift
//  Stocks
//
//  Created by Kun Huang on 12/12/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class IPOCell: UITableViewCell {

    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var dateOfIPOLabel: UILabel!
    @IBOutlet weak var companySymbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var shareAmountLabel: UILabel!
    @IBOutlet weak var marketLabel: UILabel!
    
    var ipo: IPOData? {
        didSet {
            companyLabel.text = ipo?.companyName
            dateOfIPOLabel.text = "Date: \(ipo?.expectedDate ?? "No Date")"
            companySymbolLabel.text = "Symbol: \(ipo?.symbol ?? "No Symbol")"
            priceLabel.text = "Price: \(ipo?.price ?? "No Price")"
            shareAmountLabel.text = "Shares: \(ipo?.amount ?? "0")"
            marketLabel.text = "Market: \(ipo?.market ?? "no")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
