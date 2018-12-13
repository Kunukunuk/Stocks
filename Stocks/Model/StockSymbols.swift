//
//  StockSymbols.swift
//  Stocks
//
//  Created by Kun Huang on 12/13/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import Foundation

class StockSymbols {
    
    var stockSymbol: String?
    var stockType: String?
    var stockName: String?
    
    init(stockDict: [String: Any]) {
        
        stockSymbol = stockDict["symbol"] as? String
        stockType = stockDict["type"] as? String
        stockName = stockDict["name"] as? String
    }
}
