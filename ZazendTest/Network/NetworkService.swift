//
//  NetworkService.swift
//  ZazendTest
//
//  Created by Sasha on 2/7/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation
import Moya


let BASE_URL = "https://restcountries.eu/rest/v2/"

enum NetworkService {
    case countryByRegion(region: String)
    case allCountry
    case countryByCode(code: String)
}

extension NetworkService: TargetType {
    
    public var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    public var path: String {
        switch self {
        case .countryByRegion(let region):
            return "region/\(region.lowercased())"
        case .allCountry:
            return "all/"
        case .countryByCode(let code):
            return "alpha/\(code.lowercased())"
        }
    }
    
    public var method: Moya.Method {
       return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return [:]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}

