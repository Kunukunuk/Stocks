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
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getStockData() {
        
    }
}
