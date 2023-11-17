//
//  Weather.swift
//  Weather_Challenge
//
//  Created by DA MAC M1 157 on 2023/11/17.
//

import Foundation
/**Used quickType Website to easily Map data to a Model**/

// MARK: - Weather
struct Weather: Codable {
    let current: Current
    let hourly: [Current]
    let daily: [Daily]
}

// MARK: - Current
struct Current: Codable {
    let dt: Int
    let temp: Double
    let weather: [WeatherElement]
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let main: Main
}


enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}


// MARK: - Daily
struct Daily: Codable {
    let dt: Int
    let temp: Temp
    let weather: [WeatherElement]
}

// MARK: - Temp
struct Temp: Codable {
    let min: Double
    let max: Double
}
