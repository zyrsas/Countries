//
//  ViewController.swift
//  ZazendTest
//
//  Created by Sasha on 2/7/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

class CountriesController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       configureTableView()
    }
    
    
    // MARK: - Configure TableView
    
    func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "RegionCell", bundle: nil), forCellReuseIdentifier: "regionCell")
    }

}

// MARK: - UITableVIiew Delegates

extension CountriesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Region.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "regionCell") as! RegionCell
        cell.setupCell(region: Region.allCases[indexPath.row].rawValue)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
}
