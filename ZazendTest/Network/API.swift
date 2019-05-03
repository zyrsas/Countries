//
//  API.swift
//  ZazendTest
//
//  Created by Sasha on 2/7/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation
import Moya
import Moya_ObjectMapper

class API {
    public static let shared = API()
    
    private let provider = MoyaProvider<NetworkService>()

    func getCountriesByRegion(region: String, completionHandler: @escaping ([CountryResponse], String?) -> Void){
        provider.request(.countryByRegion(region: region)) { (result) in
            switch result {
            case .success(let response):
                if let countries: [CountryResponse]  = try? response.mapArray(CountryResponse.self) {
                    completionHandler(countries, nil)
                } else {
                    completionHandler([], "Not Found")
                }
            case .failure(let error):
                 completionHandler([], error.localizedDescription)
            }
        }
    }
    
    func getCountriesByCode(code: String, completionHandler: @escaping (CountryResponse?, String?) -> Void){
        provider.request(.countryByCode(code: code)) { (result) in
            switch result {
            case .success(let response):
                if let countries: CountryResponse  = try? response.mapObject(CountryResponse.self) {
                    completionHandler(countries, nil)
                } else {
                    completionHandler(nil, "Not Found")
                }
            case .failure(let error):
                completionHandler(nil, error.localizedDescription)
            }
        }
    }
    
    func getAllCountries(completionHandler: @escaping ([CountryResponse], String?) -> Void){
        provider.request(.allCountry) { (result) in
            switch result {
            case .success(let response):
                if let countries: [CountryResponse]  = try? response.mapArray(CountryResponse.self) {
                    completionHandler(countries, nil)
                } else {
                    completionHandler([], "Not Found")
                }
            case .failure(let error):
                completionHandler([], error.localizedDescription)
            }
        }
    }
}
