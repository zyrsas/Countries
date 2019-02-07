//
//  SearchController.swift
//  ZazendTest
//
//  Created by Sasha on 2/7/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SearchController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var countries: [CountryResponse] = []
    var searchActive : Bool = false
    var filtered:[CountryResponse] = []
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        API.shared.getAllCountries { (response, error) in
            if error == nil {
                self.countries = response
                self.tableView.reloadData()
            } else {
                print(error)
            }
        }
        
        self.configureTableView()
        self.searchBar.delegate = self
        self.initFilter()
    }
    
    
    func initFilter() {
        searchBar
            .rx.text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] query in
                self.filtered = self.countries.filter { $0.name.hasPrefix(query) }
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
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

extension SearchController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as! CountryCell
        cell.setupCell(flag: self.filtered[indexPath.row].alpha2Code, countryName: self.filtered[indexPath.row].name, countryNativeName: self.filtered[indexPath.row].nativeName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetail", sender: self.filtered[indexPath.row])
    }
}

extension SearchController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}
