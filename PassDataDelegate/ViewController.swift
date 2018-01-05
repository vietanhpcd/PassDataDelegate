//
//  ViewController.swift
//  PassDataDelegate
//
//  Created by Anhdzai on 1/5/18.
//  Copyright © 2018 Anhdzai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFIeld: UITextField!
    
    var dataString: String?
    var dataDelegate: DataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFIeld.text = dataString
    }

    @IBAction func popTableView(_ sender: UIBarButtonItem) {
        if let dataInt = Int(textFIeld.text!) {
            dataDelegate?.delegate(dataInt: dataInt)
            navigationController?.popViewController(animated: true)
        }
    }
}

