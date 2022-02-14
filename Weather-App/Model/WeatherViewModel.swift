//
//  WeatherViewModel.swift
//  SwiftUIWeather
//
//  Created by Elliot Joseph on 07/02/2022.
//

import SwiftUI
import CoreLocation
import SpriteKit
public final class WeatherViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var temperature: String = ""
    @Published var Description: String = ""
    @Published var id: Int = 0
    @Published var effect: SKScene?
    let weatherManager = WeatherManager()
    @ObservedObject var locationManager = LocationManager()
    
    
    
    func resetSprite(_ id: Int){
        switch self.id {
            case 500...531:
                self.effect = SpriteManager.rainEffect
            case 600...632:
                self.effect = SpriteManager.snowEffect
            default:
                self.effect = nil
        }
    }
//
    func loadDataByCity() {
        weatherManager.getWeatherDataByName { weather, errorMsg in
            guard let weather = weather else {
                return
            }
            
            DispatchQueue.main.async{
                self.name = weather.name
                self.temperature = String(format: "%.2f", weather.main.temp)
                self.Description = weather.weather.first?.description ?? ""
                self.id = weather.weather.first?.id ?? 0
                self.resetSprite(self.id)
            }
        }
    }
    
    func loadDataByLocation(){
        weatherManager.coordinates = locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 25, longitude: 55)
        weatherManager.getWeatherDataByLocation { weather, errorMsg in
            guard let weather = weather else {
                return
            }
            DispatchQueue.main.async{
                self.name = weather.name
                self.temperature = String(format: "%.2f", weather.main.temp)
                self.Description = weather.weather.first?.description ?? ""
                self.id = weather.weather.first?.id ?? 0
                self.resetSprite(self.id)
            }
            print("view id", self.id)
        }
    }
}
