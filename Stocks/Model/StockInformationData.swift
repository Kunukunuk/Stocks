//
//  StockInformationData.swift
//  Stocks
//
//  Created by Kun Huang on 12/16/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import Foundation

class StockInformationData {
    
    var stockCharts: NSArray?
    var stockNews: NSArray?
    var stockQuote: [String: Any] = [:]
    
    init(charts: NSArray, news: NSArray, quote: [String: Any]) {
        self.stockNews = news
        self.stockQuote = quote
        self.stockCharts = charts
    }
    
}
