//
//  ViewController.swift
//  Demo
//
//  Created by Weiwenshe on 2018/8/29.
//  Copyright © 2018 com.weiwenshe. All rights reserved.
//

import UIKit
import Enhancement

class ViewController: UIViewController {
    private var enhancements: [String] = []
    
    private lazy var tableView: UITableView = {
        let table  = UITableView(frame: UIScreen.main.bounds)
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateDate()
        title = "Home"
        view.addSubview(tableView)
    }
    
    private func generateDate() {
        enhancements = ["notification-observer", "timer"]
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return enhancements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
        cell.textLabel?.text = enhancements[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = NotificationObserverDemo()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = TimerDemo()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}

