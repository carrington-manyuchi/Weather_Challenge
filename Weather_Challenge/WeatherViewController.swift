//
//  ViewController.swift
//  Weather_Challenge
//
//  Created by DA MAC M1 157 on 2023/11/17.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorColor = .systemGray
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }


}

