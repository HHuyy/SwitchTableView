//
//  ViewController.swift
//  SwitchTableView
//
//  Created by tham gia huy on 5/10/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if name != nil {
            nameText.text = name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        name = nameText.text
    }


}

