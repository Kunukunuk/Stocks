//
//  ShowStockViewController.swift
//  Stocks
//
//  Created by Kun Huang on 12/13/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class ShowStockViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockData?.stockCharts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockChartCell", for: indexPath) as! StockChartCell
        
        if let chartss = stockData?.stockCharts {
            
            let dict = chartss[indexPath.row] as! [String: Any]
            cell.stock = dict
        }
        
        return cell
    }
    

    
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
    
    @IBOutlet weak var popUpConstraint: NSLayoutConstraint!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var companyNamePopupLabel: UILabel!
    @IBOutlet weak var tagPopupLabel: UILabel!
    @IBOutlet weak var descriptionPopupLabel: UILabel!
    @IBOutlet weak var websitePopupLabel: UILabel!
    @IBOutlet weak var ceoPopupLabel: UILabel!
    @IBOutlet weak var industryPopupLabel: UILabel!
    @IBOutlet weak var sectorPopupLabel: UILabel!
    var isShowingPopup: Bool = false
    
    
    var stockData: StockInformationData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popUpConstraint.constant = -500
        //popUpView.sizeToFit()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        popUpView.layer.cornerRadius = 15
        popUpView.layer.masksToBounds = true
        
        let button = UIButton(type: .custom)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle(stockInfo?.stockSymbol, for: .normal)
        button.addTarget(self, action: #selector(self.clickOnTitle), for: .touchUpInside)
        
        self.navigationItem.titleView = button
        companyNameLabel.text = stockInfo?.stockName
        
        getStockInfos()
    }
    
    @IBAction func clickOnTitle(button: UIButton) {
        if isShowingPopup {
            
            popUpConstraint.constant = -500
            
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            popUpView.alpha = 0
            isShowingPopup = false
            
        } else {
            popUpConstraint.constant = 0
            
            popUpView.alpha = 1
            
            UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            getCompanyInfo(symbol: (stockInfo?.stockSymbol)!)
            
            isShowingPopup = true
        }
    }
    
    func getCompanyInfo(symbol: String) {
        APIManager().getStockCompany(with: symbol) { (companyInfo, error) in
            if error == nil {
                DispatchQueue.main.sync {
                    self.companyNamePopupLabel.text = companyInfo!.companyName
                    self.tagPopupLabel.text = companyInfo!.tags
                    self.descriptionPopupLabel.text = companyInfo!.description
                    self.ceoPopupLabel.text = companyInfo!.ceo
                    self.sectorPopupLabel.text = companyInfo!.sector
                    self.websitePopupLabel.text = companyInfo!.website
                    self.industryPopupLabel.text = companyInfo!.industry
                }
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    func getStockInfos() {
        
        APIManager().getStockData(with: (stockInfo?.stockSymbol)!) { (stockData, error) in
            if error == nil {
                self.stockData = stockData
                DispatchQueue.main.sync {
                    self.fillTheInformations()
                    self.tableView.reloadData()
                }
            } else {
                print("error : \(error?.localizedDescription)")
            }
        }
    }
    
    func fillTheInformations() {
        let quote = (stockData?.stockQuote)!
        
        priceLabel.text = "\(quote["latestPrice"] as? Double ?? 0)"
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
