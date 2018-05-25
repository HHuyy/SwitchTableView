//
//  TableViewController.swift
//  SwitchTableView
//
//  Created by tham gia huy on 5/10/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var noData: UILabel!
    @IBOutlet weak var noDataView: UIView!
    @IBOutlet weak var nameSwitch: UISwitch!
    var dataSourceNumber = DataNumber()
    var dataSourceString = DataString()
    var hasNoData: Bool = false {
        didSet {
            hasNoData ? (tableView.backgroundView = noData) : (tableView.backgroundView = noDataView)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSourceNumber
        dataSourceNumber.tableViewND = self
        dataSourceString.tableviewND = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func switchChange(_ sender: UISwitch) {
        sender.isOn ? (tableView.dataSource = dataSourceNumber) : (tableView.dataSource = dataSourceString)
        sender.isOn ? (hasNoData = dataSourceNumber.arrayNumber.count == 0) : (hasNoData = dataSourceString.arrayString.count == 0)
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameSwitch.isOn ? (hasNoData = dataSourceNumber.arrayNumber.count == 0) : (hasNoData = dataSourceString.arrayString.count == 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? ViewController {
            if let inDexPath = tableView.indexPathForSelectedRow {
                nameSwitch.isOn ? (detailViewController.name = String(dataSourceNumber.arrayNumber[inDexPath.row])) : (detailViewController.name = dataSourceString.arrayString[inDexPath.row])
            }
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let detailViewController = unwindSegue.source as? ViewController {
            if let inDexPath = tableView.indexPathForSelectedRow {
                nameSwitch.isOn ? (dataSourceNumber.arrayNumber[inDexPath.row] = Int(detailViewController.name ?? "") ?? 0) : (dataSourceString.arrayString[inDexPath.row] = detailViewController.name ?? "")
            } else {
                nameSwitch.isOn ? (dataSourceNumber.arrayNumber.append(Int(detailViewController.name ?? "") ?? 0)) : (dataSourceString.arrayString.append(detailViewController.name ?? ""))
            }
        }
        tableView.reloadData()
    }
   
}
