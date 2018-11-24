//
//  APIManager.swift
//  Stocks
//
//  Created by Kun Huang on 11/23/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import Foundation

class APIManager {
    
    var session: URLSession
    let basicURL = "https://api.iextrading.com/1.0"
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getStockData() {
        
        let apiURL = URL(string: basicURL + "/stock/market/batch?symbols=aapl,fb,tsla&types=quote,news,chart&range=1m&last=5")
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            guard let dataJson = data else {
                print(error?.localizedDescription)
                return
            }
            let dataDictionary = try! JSONSerialization.jsonObject(with: dataJson, options: []) as! [String: Any]
            
            print(dataDictionary)
        }
        task.resume()
        
    }
}
