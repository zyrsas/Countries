//
//  CountryDetailController.swift
//  ZazendTest
//
//  Created by Sasha on 2/7/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit
import MapKit

class CountryDetailController: UIViewController {
    
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var currenciesLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    public var country: CountryResponse?
    
    fileprivate var borders: [CountryResponse] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.confireUI()
        self.configureMap()
        self.configureTableView()
        self.getBordersWith()
    }
    
    func confireUI() {
        self.title = self.country?.name
        self.flagLabel.text = self.country?.alpha2Code.emojiFlag()
        
        var currencies = ""
        self.country?.currencies.forEach({ (item) in
              currencies += "\(item.name); "
        })
        self.currenciesLabel.text = "\(currencies)"

        var languages = ""
        self.country?.languages.forEach({ (item) in
             languages += "\(item.name); "
        })
        self.languageLabel.text = "\(languages)"
        
    }
    
    func configureMap() {
        let coord = CLLocationCoordinate2D(latitude: self.country?.latlng.first ?? 0.0, longitude: self.country?.latlng.last ?? 0.0)
        
        let annotation = MKPointAnnotation()
        annotation.title = self.country?.name
        annotation.subtitle = self.country?.capital
        annotation.coordinate = coord
        self.map.addAnnotation(annotation)
        
        self.map.setCenter(coord, animated: true)
    }
    
    
    func getBordersWith() {
        self.country?.borders.forEach({ (item) in
            API.shared.getCountriesByCode(code: item) { (response, error) in
                if error == nil {
                    self.borders.append(response!)
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    
    // MARK: - Configure TableView
    
    func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "countryCell")
    }

}

// MARK: - UITableVIiew Delegates

extension CountryDetailController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.borders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as! CountryCell
        
        cell.setupCell(flag: self.borders[indexPath.row].alpha2Code, countryName: self.borders[indexPath.row].name, countryNativeName: self.borders[indexPath.row].nativeName)
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "detailCountryVC") as! CountryDetailController
        vc.country = self.borders[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


