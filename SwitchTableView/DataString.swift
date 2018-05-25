//
//  DataString.swift
//  SwitchTableView
//
//  Created by tham gia huy on 5/10/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import UIKit

class DataString: NSObject, UITableViewDataSource {
    var arrayString = ["mot", "hai", " ba", " bon"]
    var tableviewND: TableViewController?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String(arrayString[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayString.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableviewND?.hasNoData = arrayString.count == 0
        }
    }
}
