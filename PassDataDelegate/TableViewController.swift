//
//  TableViewController.swift
//  PassDataDelegate
//
//  Created by Anhdzai on 1/5/18.
//  Copyright © 2018 Anhdzai. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, DataDelegate {
    
    func delegate(dataInt: Int) {
        if let indexPath = tableView.indexPathForSelectedRow {
            array[indexPath.row] = dataInt
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }

    var array = [Int](0...10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(array[indexPath.row])
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let data = segue.destination as? ViewController, let indexPath = tableView.indexPathForSelectedRow {
            data.dataDelegate = self
            data.dataString = String(array[indexPath.row])
        }
    }
}
