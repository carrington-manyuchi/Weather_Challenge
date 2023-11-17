//
//  Service.swift
//  Weather_Challenge
//
//  Created by DA MAC M1 157 on 2023/11/17.
//

import Foundation

class WeatherService {
    
    static let shared = WeatherService()
    
    private init() {}
    
    func getWeatherData(latitude: Double, longitude: Double, completion: @escaping (Result<Weather, Error>) -> Void) {
        
        let url = "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely,alerts&appid=a939b3a2c089cdc4dcefee3b74142319&units=metric"
        
        // Make the API request and handle the response
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data not available"])))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(Weather.self, from: data)
                completion(.success(json))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
