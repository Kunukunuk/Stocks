//
//  SearchCell.swift
//  Stocks
//
//  Created by Kun Huang on 12/18/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var stockNameLabel: UILabel!
    
    var stockInfo: StockSymbols? {
        didSet {
            stockNameLabel.text = "\(stockInfo?.stockName ?? "") (\(stockInfo?.stockSymbol ?? ""))"
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
