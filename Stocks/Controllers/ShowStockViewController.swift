//
//  ShowStockViewController.swift
//  Stocks
//
//  Created by Kun Huang on 12/13/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class ShowStockViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var companyNameLabel: UILabel!
    var stockInfo: StockSymbols?
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var weekHighLabel: UILabel!
    @IBOutlet weak var weekLowLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var avgVolLabel: UILabel!
    @IBOutlet weak var mktCapLabel: UILabel!
    @IBOutlet weak var peRatioLabel: UILabel!
    @IBOutlet weak var ytdChangeLabel: UILabel!
    @IBOutlet weak var sectorLabel: UILabel!
    @IBOutlet weak var exchangeLabel: UILabel!
    
    var stockData: StockInformationData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = stockInfo?.stockSymbol
        companyNameLabel.text = stockInfo?.stockName
        
        getStockInfos()
    }
    
    
    func getStockInfos() {
        
        APIManager().getStockData(with: (stockInfo?.stockSymbol)!) { (stockData, error) in
            if error == nil {
                self.stockData = stockData
                DispatchQueue.main.sync {
                    self.fillTheInformations()
                }
            } else {
                print("error : \(error?.localizedDescription)")
            }
        }
    }
    
    func fillTheInformations() {
        let quote = (stockData?.stockQuote)!
        
        openLabel.text = "Open: \(quote["open"] as? Double ?? 0)"
        highLabel.text = "High: \(quote["high"] as? Double ?? 0)"
        lowLabel.text = "Low: \(quote["low"] as? Double ?? 0)"
        weekHighLabel.text = "52WKHigh: \(quote["week52High"] as? Double ?? 0)"
        weekLowLabel.text = "52WKLow: \(quote["week52Low"] as? Double ?? 0)"
        volumeLabel.text = "LatestVol: \(quote["latestVolume"] as? Int ?? 0)"
        avgVolLabel.text = "AVGVol: \(quote["avgTotalVolume"] as? Int ?? 0)"
        mktCapLabel.text = "MKT Cap: \(quote["marketCap"] as? Int ?? 0)"
        peRatioLabel.text = "PE Ratio: \(quote["peRatio"] as? Double ?? 0)"
        ytdChangeLabel.text = "YTD Change: \(quote["ytdChange"] as? Double ?? 0)"
        sectorLabel.text = "Sector: \(quote["sector"] as? String ?? "")"
        exchangeLabel.text = "Exchange: \(quote["primaryExchange"] as? String ?? "")"
    }

    @IBAction func getNews(_ sender: UIButton) {
        let news = (stockData?.stockNews)!
        let new = news[0] as! [String: Any]
        
        let url = new["url"] as? String ?? ""
        
        guard let openURL = URL(string: url) else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(openURL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(openURL)
        }
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
