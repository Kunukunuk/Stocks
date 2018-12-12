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
    
    func getStockData(with symbols: String) {
        
//        /stock/aapl/batch?types=quote,news,chart&range=1m&last=1
//        /stock/market/batch?symbols=aapl,fb,tsla&types=quote,news,chart&range=1m&last=5
        
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
    
    func getStockBook() {
//        /stock/aapl/book
    }
    
    func getStockCollection() {
//        /stock/market/collection/sector?collectionName=Health%20Care
//        /stock/market/collection/tag?collectionName=Computer%20Hardware
//        /stock/market/collection/list?collectionName=iexvolume
    }
    
    func getStockCharts() {
//        /stock/aapl/chart
//        /stock/aapl/chart/5y
//        /stock/aapl/chart/2y
//        /stock/aapl/chart/1y
//        /stock/aapl/chart/ytd
//        /stock/aapl/chart/6m
//        /stock/aapl/chart/3m
//        /stock/aapl/chart/1m
//        /stock/aapl/chart/1d
//        /stock/aapl/chart/date/20180129
//        /stock/aapl/chart/dynamic
    }
    
    func getStockCompany() {
//        /stock/aapl/company
    }
    
    func getCrypto() {
//        /stock/market/crypto
        let apiURL = URL(string: basicURL + "/stock/market/crypto")
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            guard let dataJson = data else {
                print(error?.localizedDescription)
                return
            }
            let dataArray = try! JSONSerialization.jsonObject(with: dataJson, options: []) as! NSArray
            
            print(dataArray)
        }
        task.resume()
    }
    
    func getStockDividends() {
//        /stock/aapl/dividends/5y
//        /stock/aapl/dividends/2y
//        /stock/aapl/dividends/1y
//        /stock/aapl/dividends/ytd
//        /stock/aapl/dividends/6m
//        /stock/aapl/dividends/3m
//        /stock/aapl/dividends/1m
    }
    
    func getStockEarnings() {
//        /stock/aapl/earnings
    }
    
    func getUpcomingIPOs(completion: @escaping ([IPOData]?, Error?) -> ()) {
//        /stock/market/upcoming-ipos
//        /stock/market/today-ipos
        var IPOs: [IPOData] = []
        
        let apiURL = URL(string: basicURL + "/stock/market/upcoming-ipos")
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            guard let dataJson = data else {
                print(error?.localizedDescription)
                completion(nil, error)
                return
            }
            let dataDictionary = try! JSONSerialization.jsonObject(with: dataJson, options: []) as! [String: Any]
            
            //let rawData = dataDictionary["rawData"] as! NSArray
            let viewData = dataDictionary["viewData"] as! NSArray
            for each in viewData {
                let dictionary = each as! [String: Any]
                let ipo = IPOData(viewData: dictionary)
                IPOs.append(ipo)
            }
            completion(IPOs, nil)
        }
        task.resume()
    }
    
    func getTodayIPOs(completion: @escaping ([IPOData]?, Error?) -> ()) {
        
        var IPOs: [IPOData] = []
        
        let apiURL = URL(string: basicURL + "/stock/market/today-ipos")
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            guard let dataJson = data else {
                print(error?.localizedDescription)
                completion(nil, error)
                return
            }
            let dataDictionary = try! JSONSerialization.jsonObject(with: dataJson, options: []) as! [String: Any]
            
            //let rawData = dataDictionary["rawData"] as! NSArray
            let viewData = dataDictionary["viewData"] as! NSArray
            for each in viewData {
                let dictionary = each as! [String: Any]
                print(dictionary)
                let ipo = IPOData(viewData: dictionary)
                IPOs.append(ipo)
            }
            completion(IPOs, nil)
        }
        task.resume()
    }
    
    func getCompanyLogo() {
//        /stock/aapl/logo
    }
    
    func getList() {
        
//        /stock/market/list/mostactive
//        /stock/market/list/gainers
//        /stock/market/list/losers
//        /stock/market/list/iexvolume
//        /stock/market/list/iexpercent
//        /stock/market/list/infocus

        let apiURL = URL(string: basicURL + "/stock/market/list/gainers")
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            guard let dataJson = data else {
                print(error?.localizedDescription)
                return
            }
            let dataArray = try! JSONSerialization.jsonObject(with: dataJson, options: []) as! NSArray
            
            print(dataArray)
        }
        task.resume()
        
    }
    
    func getStockNew() {
        
        let apiURL = URL(string: "https://financialmodelingprep.com/api/stock/actives")
        
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            guard let dataJson = data else {
                print(error?.localizedDescription)
                return
            }
            let decodeData = String(data: dataJson, encoding: .utf8)!
            
            print(decodeData)
            
        }
        
        task.resume()
    }
}
