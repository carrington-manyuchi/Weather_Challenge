//
//  WeatherTableViewCell.swift
//  Weather_Challenge
//
//  Created by DA MAC M1 157 on 2023/11/17.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    static let identifier = "WeatherTableViewCell"
    
    private let weatherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    private let dayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    private let weatherIconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    private let tempLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        return stackView
    }()
    
     let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wednesday"
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
     let weatherIcon: UIImageView = {
        let imageView = UIImageView()
         imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "sun.max")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
     let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "22°"
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        configureConstraints()
    }
    
    private func setupViews() {
        self.addSubview(weatherStackView)
        weatherStackView.addArrangedSubview(dayStackView)
        weatherStackView.addArrangedSubview(weatherIconStackView)
        weatherStackView.addArrangedSubview(tempLabelStackView)
        
        dayStackView.addArrangedSubview(dayLabel)
        weatherIconStackView.addArrangedSubview(weatherIcon)
        tempLabelStackView.addArrangedSubview(tempLabel)
    }
    
    private func configureConstraints() {
        let weatherStackViewConstraints = [
            weatherStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            weatherStackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            weatherStackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            weatherStackView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ]
        NSLayoutConstraint.activate(weatherStackViewConstraints)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension WeatherTableViewCell {
    
    func configure(with model: Daily) {
        self.dayLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.dt)))
        self.weatherIcon.image = UIImage(named: "sun")
        
    }
}
