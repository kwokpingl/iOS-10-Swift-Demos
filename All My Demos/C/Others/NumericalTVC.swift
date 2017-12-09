
//
//  NumericalTVC.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/8.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

import Foundation
import UIKit

class NumericalTVC: UITableViewController {
    
    let numericalTypes = ["Int8", "Int16", "Int32", "Int64", "Float", "Double"]
    let valueDictionary = ["Int8":["\(Int8.min)", "\(Int8.max)"],
                           "Int16":["\(Int16.min)", "\(Int16.max)"],
                           "Int32": ["\(Int32.min)", "\(Int32.max)"],
                           "Int64":["\(Int64.min)", "\(Int64.max)"],
                           ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIDs.tableViewBasicCellID)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 10
    }
    
    // MARK: - DATA SOURCE
    override func numberOfSections(in tableView: UITableView) -> Int {
        return numericalTypes.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return numericalTypes[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = numericalTypes[section]
        guard let values = valueDictionary[type] else {
            return 0
        }
        return values.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.tableViewBasicCellID, for: indexPath)
        
        cell.textLabel?.numberOfLines = 0
        
        let row = indexPath.row
        let type = numericalTypes[indexPath.section]
        
        if let values = valueDictionary[type] {
            let value = values[row]
            
            switch indexPath.row {
            case 0:
                // Min
                cell.textLabel?.text = "Min: \(value)"
            default:
                cell.textLabel?.text = "Max: \(value)"
            }
        }
        
        
        return cell
    }
}
