//
//  ViewController.swift
//  Weather_Challenge
//
//  Created by DA MAC M1 157 on 2023/11/17.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    var hourly = [Current]()
    var models = [Daily]()
    var current: Current?
    
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorColor = .systemGray
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        tableView.register(WeatherHeader.self, forHeaderFooterViewReuseIdentifier: "header")
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
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocation()
    }
    
    //MARK: - Location
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }
    
    func requestWeatherForLocation() {
        
        guard let currentLocation = currentLocation else {
            return
        }
        let long = currentLocation.coordinate.longitude
        let lat = currentLocation.coordinate.latitude
        
        let url = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(long)&exclude=minutely,alerts&appid=a939b3a2c089cdc4dcefee3b74142319&units=metric"
        
        let url2 = "https://api.openweathermap.org/data/2.5/onecall?lat=-26.005&lon=28.0039&exclude=minutely,alerts&appid=a939b3a2c089cdc4dcefee3b74142319"
        print(url2)
        
        print("\(long) & \(lat)"  )
        
        //make a request with a datatask
        
        let dataTask = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
             // validation
            
            guard let data = data, error == nil else {
                print("Data validation is wrong")
                return
            }
            
            //convert data to models / some object
            
            var json: Weather?
            
            do {
                json = try JSONDecoder().decode(Weather.self, from: data)
            } catch {
                print("error : \(error)")
            }
            
            guard let result = json else {
                return
            }
            
            let entries = result.daily
            self.models.append(contentsOf: entries)
            
            
            let current = result.current
            self.current = current
            
            let  hours = result.hourly
            self.hourly = hours
            
           // print(result.hourly)
            
            
            // update user interface

            DispatchQueue.main.async {
                self.tableView.reloadData()
                
                //self.tableView.tableHeaderView = self.createTableHeader()
            }
            // update user interface

        }
        dataTask.resume()
    }
    
    private func configureConstraints() {
       let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
       ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 50
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: models[indexPath.row])
    

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        return header
    }
    
    
    
    
}

