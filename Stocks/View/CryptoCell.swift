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

    var cry: CryptoData? {
        didSet {
        
            companySymbolLabel.text = (" \(cry?.companyName ?? "") (\(cry?.symbol ?? ""))")
            openLabel.text = ("Open: \(cry?.open ?? 0)")
            closeLabel.text = ("Close: \(cry?.close ?? 0)")
            previousCloseLabel.text = ("Previous: \(cry?.previousClose ?? 0)")
            latestPriceLabel.text = ("Latest$: \(cry?.latestPrice ?? 0)")
            latestVolumeLabel.text = ("LastestVol: \(cry?.latestVolume ?? 0)")
            highLabel.text = ("High: \(cry?.high ?? 0)")
            lowLabel.text = ("Low: \(cry?.low ?? 0)")
            askPriceLabel.text = ("Ask$: \(cry?.askPrice ?? 0)")
            askSizeLabel.text = ("AskSize: \(cry?.askSize ?? 0)")
            bidSizeLabel.text = ("BidSize: \(cry?.bidSize ?? 0)")
            bidPriceLabel.text = ("Bid$: \(cry?.bidPrice ?? 0)")
            changeLabel.text = ("Change: \(cry?.change ?? 0)")
            changePercentLabel.text = ("Change%: \(cry?.changePercent ?? 0)")
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
