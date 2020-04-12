//
//  NextViewController.swift
//  TableView
//
//  Created by poti on 2020/04/12.
//  Copyright © 2020 kaoru. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var todoLabel: UILabel!
        
    var toDoString = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        todoLabel.text = toDoString
    }

}
