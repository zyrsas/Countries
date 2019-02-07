//
//  CountryController.swift
//  ZazendTest
//
//  Created by Sasha on 2/7/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

class CountryController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    public var region: String = ""
    fileprivate var countries: [CountryResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        API.shared.getCountriesByRegion(region: self.region) { (response, error) in
            if error == nil {
                self.countries = response
                self.tableView.reloadData()
            } else {
                
            }
        }
    }
    
    // MARK: - Configure TableView
    
    func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "countryCell")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let countryDetailController = segue.destination as? CountryDetailController {
            countryDetailController.country = sender as? CountryResponse
        }
    }

}

// MARK: - UITableVIiew Delegates

extension CountryController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as! CountryCell
        cell.setupCell(flag: self.countries[indexPath.row].alpha2Code, countryName: self.countries[indexPath.row].name, countryNativeName: self.countries[indexPath.row].nativeName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showCountryDetail", sender: self.countries[indexPath.row])
    }
}
