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
        setupViews()
        configureConstraints()
    }
    
    
    private func setupViews() {
        view.backgroundColor = .blue
        view.addSubview(tableView)
        //tableView.delegate = self
       // tableView.dataSource = self
    }
    
    private func configureConstraints() {
        
    }


}


