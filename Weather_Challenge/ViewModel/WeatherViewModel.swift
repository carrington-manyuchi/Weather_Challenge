//
//  WeatherViewModel.swift
//  Weather_Challenge
//
//  Created by DA MAC M1 157 on 2023/11/17.
//

import Foundation

class WeatherViewModel {
    var currentWeather: Current?
    var hourlyWeather: [Current] = []
    var dailyWeather: [Daily] = []

    // Location Properties
    var locationName: String {
        return "Your Location" // Replace with actual location logic
    }

    // Current Weather Properties
    var currentTemperature: String {
        return "\(currentWeather?.temp ?? 0)°"
    }

    var currentWeatherDescription: String {
        return "\(currentWeather?.weather.first?.main.rawValue ?? "")"
    }

    var currentDateTime: String {
        return getFormattedDate(from: Date(timeIntervalSince1970: Double(currentWeather?.dt ?? 0)))
    }

    // Hourly Weather Properties
    var hourlyTemperatureStrings: [String] {
        return hourlyWeather.map { "\(Int($0.temp))°" }
    }

    // Daily Weather Properties
    var dailyWeatherViewModels: [DailyWeatherViewModel] {
        return dailyWeather.map { DailyWeatherViewModel(daily: $0) }
    }

    func configure(with weather: Weather) {
        currentWeather = weather.current
        hourlyWeather = weather.hourly
        dailyWeather = weather.daily
    }

    // Date Formatting Method
    private func getFormattedDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy h:mm a"
        return formatter.string(from: date)
    }

    // Other methods as needed...
}

class DailyWeatherViewModel {
    private let daily: Daily

    init(daily: Daily) {
        self.daily = daily
    }

    var day: String {
        return getDayForDate(Date(timeIntervalSince1970: Double(daily.dt)))
    }

    var highTemperature: String {
        return "\(Int(daily.temp.max))°"
    }

    var lowTemperature: String {
        return "\(Int(daily.temp.min))°"
    }

}

func getDayForDate(_ date: Date?) -> String {
    guard let inputDate = date else {
        return ""
    }
    
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE"
    return formatter.string(from: inputDate)
}

