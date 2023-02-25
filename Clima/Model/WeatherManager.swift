//
//  WeatherManager.swift
//  Clima
//
//  Created by Dan Payne on 2/24/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation


struct WeatherManager {
  
  var city: String = "Denver"
   let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d665a9e157c482d42dd29c028f41f9a9&units=imperial"
 
  
  
  func fetchWeather(cityName: String) {
    let urlString = "\(weatherURL)&q=\(cityName)"
   // let urlString = "http://localhost:3010/test"
    performRequest(urlString: urlString)
  }
  
  func performRequest(urlString: String) {
    
    if let url = URL(string: urlString) {
      
      let session = URLSession(configuration: .default)
      
      let task = session.dataTask(with: url) { (data, response, error) in
        if error != nil {
          print(error!)
          return
        }
        if let safeData = data {
          self.parseJSON(weatherData: safeData)
        }
      }
      
      task.resume()
    }
  }
  
  func parseJSON(weatherData: Data) {
    let decoder = JSONDecoder()
    do {
      let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
      print(decodedData.name)
      print(decodedData.coord.lat)
      print(decodedData.coord.lon)
      print(decodedData.visibility)
      print(decodedData.wind.speed)
      print(decodedData.weather[0].main)
      
    } catch {
      print(error.localizedDescription)
    }
    
  }
  
}
