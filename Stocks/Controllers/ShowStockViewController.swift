//
//  ShowStockViewController.swift
//  Stocks
//
//  Created by Kun Huang on 12/13/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class ShowStockViewController: UIViewController {

    
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
        
        openLabel.text = "Open: \(quote["open"] as! Double)"
        highLabel.text = "High: \(quote["high"] as! Double)"
        lowLabel.text = "Low: \(quote["low"] as! Double)"
        weekHighLabel.text = "52WKHigh: \(quote["week52High"] as! Double)"
        weekLowLabel.text = "52WKLow: \(quote["week52Low"] as! Double)"
        volumeLabel.text = "LatestVol: \(quote["latestVolume"] as! Int)"
        avgVolLabel.text = "AVGVol: \(quote["avgTotalVolume"] as! Int)"
        mktCapLabel.text = "MKT Cap: \(quote["marketCap"] as! Int)"
        peRatioLabel.text = "PE Ratio: \(quote["peRatio"] as! Double)"
        ytdChangeLabel.text = "YTD Change: \(quote["ytdChange"] as! Double)"
        sectorLabel.text = "Sector: \(quote["sector"] as! String)"
        exchangeLabel.text = "Exchange: \(quote["primaryExchange"] as! String)"
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