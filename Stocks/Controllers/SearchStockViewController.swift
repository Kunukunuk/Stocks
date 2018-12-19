//
//  SearchStockViewController.swift
//  Stocks
//
//  Created by Kun Huang on 12/13/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class SearchStockViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stockSymbols.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stockSymbols[row].stockSymbol
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected = stockSymbols[row]
    }

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var stockSymbols: [StockSymbols] = []
    var selected: StockSymbols?
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getStockSymbols()
    }
    
    func getStockSymbols() {
        APIManager().getAllStockSymbols { (stocks, error) in
            if error == nil {
                self.stockSymbols = stocks!
                DispatchQueue.main.sync {
                    self.pickerView.reloadAllComponents()
                    self.selected = self.stockSymbols[0]
                    self.tableView.reloadData()
                }
            }
        }
    }

    @IBAction func searchStock(_ sender: UIButton) {
        
        if searchTextField.text == "" {
            performSegue(withIdentifier: "showStock", sender: self)
        } else {
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showStock" {
            let destinationVC = segue.destination as! ShowStockViewController
            destinationVC.stockInfo = self.selected
        }
    }

}

extension SearchStockViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return stockSymbols.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        
        cell.stockInfo = stockSymbols[indexPath.row]
        
        return cell
    }
    
    
    
    
}
