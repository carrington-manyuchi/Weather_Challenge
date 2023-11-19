//
//  WeatherHeader.swift
//  Weather_Challenge
//
//  Created by DA MAC M1 157 on 2023/11/17.
//

import UIKit

class WeatherHeader: UITableViewHeaderFooterView {
    
    private static let  WeatherHeader = "identifier"
    
    private let headerBackground: UIImageView = {
        let imageView = UIImageView()
         imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sea_sunnypng")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()
    
    private let firstTopStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    
    private let topTodayTemp: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25°"
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    private let topWeatherStatus: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SUNNY"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 85
        return stackView
    }()
    
    private let firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    private let secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    private let thirdStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    private let headerMinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "min"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    private let headerMinTemp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "19°"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 1
        return label
    }()

    private let headerCurrentTemp: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25°"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let headerCurrentLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Current"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let headerMaxLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "max"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let headerMaxTemp: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "27°"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()

    override init( reuseIdentifier: String?) {
        super.init( reuseIdentifier: reuseIdentifier)
        
        //self.addSubview(containerStackView)
        self.addSubview(headerBackground)
        headerBackground.addSubview(containerStackView)

        containerStackView.addArrangedSubview(firstTopStackView)
        containerStackView.addArrangedSubview(topStackView)
        containerStackView.addArrangedSubview(bottomStackView)
        containerStackView.addArrangedSubview(firstTopStackView)

        topStackView.addArrangedSubview(firstTopStackView)
        topStackView.addArrangedSubview(topTodayTemp)
        topStackView.addArrangedSubview(topWeatherStatus)
        
        bottomStackView.addArrangedSubview(firstStackView)
        bottomStackView.addArrangedSubview(secondStackView)
        bottomStackView.addArrangedSubview(thirdStackView)
        
        firstStackView.addArrangedSubview(headerMinTemp)
        firstStackView.addArrangedSubview(headerMinLabel)
        secondStackView.addArrangedSubview(headerCurrentTemp)
        secondStackView.addArrangedSubview(headerCurrentLabel)
        thirdStackView.addArrangedSubview(headerMaxTemp)
        thirdStackView.addArrangedSubview(headerMaxLabel)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        let headerBackgroundConstraints = [
            headerBackground.topAnchor.constraint(equalTo: self.topAnchor),
            headerBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: 400)
        ]
        
        let containerStackViewConstraints = [
            containerStackView.topAnchor.constraint(equalTo: headerBackground.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: headerBackground.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: headerBackground.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: headerBackground.bottomAnchor),
            containerStackView.heightAnchor.constraint(equalToConstant: 400)
        ]
        
        NSLayoutConstraint.activate(containerStackViewConstraints)
        NSLayoutConstraint.activate(headerBackgroundConstraints)
    }
    
}
