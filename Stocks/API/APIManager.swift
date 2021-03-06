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
    
    func getAllStockSymbols(completion: @escaping ([StockSymbols]?, Error?) -> ()) {
        //    /ref-data/symbols
        
        var stockS: [StockSymbols] = []
        let apiURL = URL(string: basicURL + "/ref-data/symbols")
        
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            guard let dataJson = data else {
                print(error?.localizedDescription)
                completion(nil, error)
                return
            }
            
            let dataArray = try! JSONSerialization.jsonObject(with: dataJson, options: []) as! NSArray
            
            for each in dataArray {
                let stockDict = each as! [String: Any]
                let stock = StockSymbols(stockDict: stockDict)
                stockS.append(stock)
            }
            completion(stockS, nil)
        }
        task.resume()
    }
    
    func getStockData(with symbols: String, completion: @escaping (StockInformationData?, Error?) -> ()) {
        
//        /stock/aapl/batch?types=quote,news,chart&range=1m&last=1
//        /stock/market/batch?symbols=aapl,fb,tsla&types=quote,news,chart&range=1m&last=5
        
        let apiURL = URL(string: basicURL + "/stock/\(symbols)/batch?types=quote,news,chart&range=1m&last=1")
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            guard let dataJson = data else {
                print(error?.localizedDescription)
                completion(nil, error)
                return
            }
            let dataDictionary = try! JSONSerialization.jsonObject(with: dataJson, options: []) as! [String: Any]
            
            let chart = dataDictionary["chart"] as! NSArray
            let quote = dataDictionary["quote"] as! [String: Any]
            let news = dataDictionary["news"] as! NSArray
            
            let stockInfo = StockInformationData(charts: chart, news: news, quote: quote)
            
            completion(stockInfo, nil)
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
    
    func getStockCompany(with symbol: String, completion: @escaping (CompanyInfo?, Error?) -> ()) {
//        /stock/aapl/company
        
        let apiURL = URL(string: basicURL + "/stock/\(symbol)/company")
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            guard let dataJson = data else {
                print(error?.localizedDescription)
                completion(nil, error)
                return
            }
            let dataDict = try! JSONSerialization.jsonObject(with: dataJson, options: []) as! [String: Any]
            
            let company = CompanyInfo(dict: dataDict)
            completion(company, nil)
            
        }
        task.resume()
    }
    
    func getCrypto(completion: @escaping ([CryptoData]?, Error?) -> ()) {
//        /stock/market/crypto
        var cryptos: [CryptoData] = []
        let apiURL = URL(string: basicURL + "/stock/market/crypto")
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            guard let dataJson = data else {
                print(error?.localizedDescription)
                completion(nil, error)
                return
            }
            let dataArray = try! JSONSerialization.jsonObject(with: dataJson, options: []) as! NSArray
            
            for each in dataArray {
                let dict = each as! [String: Any]
                let crypto = CryptoData(crypto: dict)
                cryptos.append(crypto)
            }
            completion(cryptos, nil)
            //print(dataArray)
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
    
}
