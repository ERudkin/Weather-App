//
//  WeatherViewModel.swift
//  SwiftUIWeather
//
//  Created by Elliot Joseph on 07/02/2022.
//

import SwiftUI
import CoreLocation
public final class WeatherViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var temperature: String = ""
    @Published var Description: String = ""
    
    let weatherManager = WeatherManager()
    @ObservedObject var locationManager = LocationManager()
    
    //
    //    init (_ weatherManager: WeatherManager) {
    //        self.weatherManager = weatherManager
    //    }
    
    func loadDataByCity(){
        weatherManager.getWeatherDataByName { weather, errorMsg in
            guard let weather = weather else {
                return
            }
            
            DispatchQueue.main.async{
                self.name = weather.name
                self.temperature = String(format: "%.2f", weather.main.temp)
                self.Description = weather.weather.first?.description ?? ""
            }
        }
    }
    
    func loadDataByLocation(){
        weatherManager.coordinates = locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 25.1988, longitude: 55.2796)
        weatherManager.getWeatherDataByLocation { weather, errorMsg in
            guard let weather = weather else {
                return
            }
            DispatchQueue.main.async{
                self.name = weather.name
                self.temperature = String(format: "%.2f", weather.main.temp)
                self.Description = weather.weather.first?.description ?? ""
            }
            
        }
    }
}
