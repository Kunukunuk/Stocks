//
//  ViewController.swift
//  Stocks
//
//  Created by Kun Huang on 11/23/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        APIManager().getStockNew()
    }


}

