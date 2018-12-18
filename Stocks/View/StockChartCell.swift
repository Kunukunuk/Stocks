//
//  StockChartCell.swift
//  Stocks
//
//  Created by Kun Huang on 12/17/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class StockChartCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var closeLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    
    var stock: [String: Any]? {
        didSet {
            dateLabel.text = stock!["date"] as? String ?? ""
            openLabel.text = "Open: \(stock!["open"] as? Double ?? 0)"
            closeLabel.text = "Close: \(stock!["close"] as? Double ?? 0)"
            highLabel.text = "High: \(stock!["high"] as? Double ?? 0)"
            lowLabel.text = "Low: \(stock!["low"] as? Double ?? 0)"
            changeLabel.text = "Change: \(stock!["change"] as? Double ?? 0)"
            volumeLabel.text = "Volume: \(stock!["volume"] as? Double ?? 0)"
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
