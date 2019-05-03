//
//  CurrenciesResponse.swift
//  ZazendTest
//
//  Created by Sasha on 2/7/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation
import ObjectMapper

struct CurrenciesResponse: Mappable {
    
    var code: String = ""
    var name: String = ""
    var symbol: String = ""
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.code <- map["code"]
        self.name <- map["name"]
        self.symbol <- map["symbol"]
    }
}
