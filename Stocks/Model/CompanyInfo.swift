//
//  CompanyInfo.swift
//  Stocks
//
//  Created by Kun Huang on 12/19/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import Foundation

class CompanyInfo {
    
    var website: String?
    var sector: String?
    var tags: String?
    var description: String?
    var industry: String?
    var ceo: String?
    var companyName: String?
    
    init(dict: [String: Any]) {
        
        website = dict["website"] as? String ?? ""
        sector = dict["sector"] as? String ?? ""
        
        let tagsArray = dict["tags"] as? NSArray
        let mutableTags = NSMutableArray(array: tagsArray!)
        let stringTags: [String] = mutableTags.compactMap ({$0 as? String})
        
        tags = stringTags.joined(separator: ", ")
        
        description = dict["description"] as? String ?? ""
        industry = dict["industry"] as? String ?? ""
        ceo = dict["CEO"] as? String ?? ""
        companyName = dict["companyName"] as? String ?? ""
    }
}
