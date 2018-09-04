//
//  ViewController.swift
//  SortAlgorithm
//
//  Created by cjz on 2018/8/19.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let data: [String: String] = ["冒泡排序" : "BubbleSort",
                                  "选择排序" : "SelectionSort",
                                  "直接插入排序" : "InsertionSort"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.keys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let key = Array(data.keys)[indexPath.row]
        cell?.textLabel?.text = key
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        let key = (cell?.textLabel?.text)!
        let classType = swiftClassFromString(className: data[key]!)
        if let type = classType {
            let sort = type.init()
            sort.run()
        }
        
    }
    
    func swiftClassFromString(className: String) -> BaseAlgorithm.Type? {
        // get the project name
        if  let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String? {
            
            let classType = NSClassFromString(className) as? BaseAlgorithm.Type
            if let type = classType {
                return type
            }
            
            let classStringName = "\(appName).\(className)"
            if let type = NSClassFromString(classStringName) as? BaseAlgorithm.Type {
                return type
            }
            
        }
        return nil;
    }
}

