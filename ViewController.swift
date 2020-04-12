//
//  ViewController.swift
//  TableView
//
//  Created by poti on 2020/04/12.
//  Copyright © 2020 kaoru. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITabBarDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var textField: UITextField!
    
    var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    //せるが構築されるときに呼ばれる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.selectionStyle = .none
        cell.textLabel?.text = textArray[indexPath.row]
        cell.imageView!.image = UIImage(named: "checkImage")
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //ここの数だけcallforrowatが呼ばれる
        return textArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //タップしたときにその配列のインデックスの中身
        
        let nextVC = storyboard?.instantiateViewController(identifier:"next") as! NextViewController
        nextVC.toDoString = textArray[indexPath.row]
        print(textArray[indexPath.row])
        navigationController?.pushViewController(nextVC, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/6
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textArray.append(textField.text!)
        textField.resignFirstResponder()
        textField.text = ""
        //sectionの数を確認して、その数だけcallforrowatが呼ばれるという流れが繰り返される
        tableView.reloadData()
        
        return true
    }
}

