//
//  DataNumber.swift
//  SwitchTableView
//
//  Created by tham gia huy on 5/10/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import UIKit

class DataNumber: NSObject, UITableViewDataSource {
    var arrayNumber = [Int](1...4)
    var tableViewND: TableViewController?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String(arrayNumber[indexPath.row])
        return cell
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayNumber.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableViewND?.hasNoData = arrayNumber.count == 0
        }
    }
}
