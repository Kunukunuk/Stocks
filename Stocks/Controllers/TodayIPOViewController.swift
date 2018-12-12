//
//  TodayIPOViewController.swift
//  Stocks
//
//  Created by Kun Huang on 12/12/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class TodayIPOViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IPOs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IPOCell", for: indexPath) as! IPOCell
        
        cell.ipo = IPOs[indexPath.row]
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    var IPOs: [IPOData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        getTodayIPOs()
        
    }
    
    func getTodayIPOs() {
        APIManager().getTodayIPOs { (ipos, error) in
            if error == nil {
                self.IPOs = ipos!
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
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
