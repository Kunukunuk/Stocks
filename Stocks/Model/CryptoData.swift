//
//  CryptoData.swift
//  Stocks
//
//  Created by Kun Huang on 12/12/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import Foundation

class CryptoData {

    var askPrice: Double?
    var askSize: Double?
    var bidPrice: Double?
    var bidSize: Double?
    var change: Double?
    var changePercent: Double?
    var close: Double?
    var companyName: String?
    var high: Double?
    var low: Double?
    var latestPrice: Double?
    var latestTime: Double?
    var latestVolume: Double?
    var open: Double?
    var previousClose: Double?
    var symbol: String?

    init(crypto: [String: Any]) {
        
        print(crypto)
        
        askPrice = crypto["askPrice"] as? Double
        askSize = crypto["askSize"] as? Double
        bidPrice = crypto["bidPrice"] as? Double
        bidSize = crypto["bidSize"] as? Double
        change = crypto["change"] as? Double
        changePercent = crypto["changePercent"] as? Double
        close = crypto["close"] as? Double
        companyName = crypto["companyName"] as? String
        high = crypto["high"] as? Double
        low = crypto["low"] as? Double
        latestPrice = crypto["latestPrice"] as? Double
        latestTime = crypto["latestTime"] as? Double
        latestVolume = crypto["latestVolume"] as? Double
        open = crypto["open"] as? Double
        previousClose = crypto["previousClose"] as? Double
        symbol = crypto["symbol"] as? String
    }
}
