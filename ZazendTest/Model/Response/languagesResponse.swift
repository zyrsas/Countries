//
//  languagesResponse.swift
//  ZazendTest
//
//  Created by Sasha on 2/7/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation
import ObjectMapper

struct languagesResponse: Mappable {
    
    var iso639_1: String = ""
    var iso639_2: String = ""
    var name: String = ""
    var nativeName: String = ""
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.iso639_1 <- map["iso639_1"]
        self.iso639_2 <- map["iso639_2"]
        self.name <- map["name"]
        self.nativeName <- map["nativeName"]
    }
}
