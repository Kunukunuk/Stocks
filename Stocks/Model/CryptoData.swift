//
//  CryptoData.swift
//  Stocks
//
//  Created by Kun Huang on 12/12/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import Foundation

class CryptoData {

    var askPrice: String?
    var askSize: String?
    var bidPrice: String?
    var bidSize: String?
    var change: String?
    var changePercent: String?
    var close: String?
    var companyName: String?
    var high: String?
    var low: String?
    var latestPrice: String?
    var latestTime: String?
    var latestVolume: String?
    var open: String?
    var previousClose: String?
    var symbol: String?

    init(crypto: [String: Any]) {
        askPrice = crypto["askPrice"] as? String
        askSize = crypto["askSize"] as? String
        bidPrice = crypto["bidPrice"] as? String
        bidSize = crypto["bidSize"] as? String
        change = crypto["change"] as? String
        changePercent = crypto["changePercent"] as? String
        close = crypto["close"] as? String
        companyName = crypto["companyName"] as? String
        high = crypto["high"] as? String
        low = crypto["low"] as? String
        latestPrice = crypto["latestPrice"] as? String
        latestTime = crypto["latestTime"] as? String
        latestVolume = crypto["latestVolume"] as? String
        open = crypto["open"] as? String
        previousClose = crypto["previousClose"] as? String
        symbol = crypto["symbol"] as? String
    }
}
