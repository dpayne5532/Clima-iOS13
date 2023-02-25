//
//  WeatherData.swift
//  Clima
//
//  Created by Dan Payne on 2/24/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation


struct WeatherData: Codable {
  let name: String
  let main: Main
  let weather: [Weather]
  let coord: Coord
  let visibility: Double
  let wind: Wind
}


struct Main: Codable {
  let temp: Double
  let pressure: Double
  let humidity: Double
  let temp_min: Double
  let temp_max: Double
  
}

struct Weather: Codable {
  
  let main: String
  let description: String
}

struct Coord: Codable {
  let lon: Double
  let lat: Double
}


struct Wind: Codable {
  let speed: Double
  let deg: Double
}


