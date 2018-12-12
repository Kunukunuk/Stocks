//
//  IPOData.swift
//  Stocks
//
//  Created by Kun Huang on 12/12/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import Foundation

class IPOData {
    
    var amount: String?
    var companyName: String?
    var expectedDate: String?
    var floatSt: String?
    var market: String?
    var price: String?
    var shares: String?
    var symbol: String?
    
    var address: String?
    var city: String?
    var auditor: String?
    var businessDescription: String?
    var ceo: String?
    var competition: String?
    var numberOfEmployee: String?
    var netIncome: String?
    var percentOffered: String?
    var revenue: String?
    var comapnyWebsiteString: String?
    
    init(viewData: [String: Any]) {
        
        amount = viewData["Amount"] as? String
        companyName = viewData["Company"] as? String
        expectedDate = viewData["Expected"] as? String
        floatSt = viewData["Float"] as? String
        market = viewData["Market"] as? String
        shares = viewData["Shares"] as? String
        symbol = viewData["Symbol"] as? String
        price = viewData["Price"] as? String
    }
    
}
