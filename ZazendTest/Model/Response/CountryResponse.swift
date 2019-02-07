//
//  CountryResponse.swift
//  ZazendTest
//
//  Created by Sasha on 2/7/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation
import ObjectMapper


struct CountryResponse: Mappable {
    var name: String = ""
    var topLevelDomain: [String] = []
    var alpha2Code: String = ""
    var alpha3Code: String = ""

    var callingCodes: [String] = []
    var capital: String = ""
    var altSpellings: [String] = []
    var region: String = ""
    var subregion: String = ""
    var population: Int = 0
    var latlng: [Double] = []
    var demonym: String = ""
    var area: Int = 0
    var gini: Double = 0.0
    var timezones: [String] = []
    var borders: [String] = []
    var nativeName: String = ""
    var numericCode: String = ""
    var currencies: [CurrenciesResponse] = []
    var languages: [languagesResponse] = []
    var translations: String = ""
    var flag: String = ""
    var cioc: String = ""


    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.name <- map["name"]
        self.topLevelDomain <- map["topLevelDomain"]
        self.alpha2Code <- map["alpha2Code"]
        self.alpha3Code <- map["alpha3Code"]
        self.callingCodes <- map["callingCodes"]
        self.capital <- map["capital"]
        self.altSpellings <- map["altSpellings"]
        self.region <- map["region"]
        self.subregion <- map["subregion"]
        self.population <- map["population"]
        self.latlng <- map["latlng"]
        self.demonym <- map["demonym"]
        self.area <- map["area"]
        self.gini <- map["gini"]
        self.timezones <- map["timezones"]
        self.borders <- map["borders"]
        self.nativeName <- map["nativeName"]
        self.numericCode <- map["numericCode"]
        self.currencies <- map["currencies"]
        self.languages <- map["languages"]
        self.flag <- map["flag"]
        self.cioc <- map["cioc"]
    }
}


