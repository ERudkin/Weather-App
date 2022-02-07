//
//  WeatherModel.swift
//  SwiftUIWeather
//
//  Created by Elliot Joseph on 07/02/2022.
//

import Foundation
import ObjectMapper
import Alamofire
import CoreLocation

class WeatherModel: BaseModel {
    var name: String = ""
    var main: Main = Main()
    var weather: [Weather] = []
    var message:String?
    var code: Int?
    override func mapping(map: Map) {
        self.name       <- map["name"]
        self.main       <- map["main"]
        self.weather    <- map["weather"]
        
        self.message <- map["message"]
        self.code <- map["cod"]
 
    }
    
    
    
    
     
}

class WeatherManager {
    var name: String
    var coordinates: CLLocationCoordinate2D
    init(_ name: String = "", coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)){
        self.name = name
        self.coordinates = coordinates
    }
    
    func getWeatherDataByName(completion: @escaping (_ weather:WeatherModel?, _ errorMsg:String?)->Void) {
        APIManager.loadRequest(weatherService: .byName(name: name)) { (response: DataResponse<WeatherModel,AFError>) in
            
            guard response.error == nil else {
                completion(nil, response.error?.localizedDescription)
                return
            }
            //             next line will change regarding to your response form
            response.value?.message != nil ?  completion(nil, response.value?.message) : completion(response.value, nil)
        }
        
    }
    
    func getWeatherDataByLocation(completion: @escaping (_ weather:WeatherModel?, _ errorMsg:String?)->Void) {
        APIManager.loadRequest(weatherService: .byCoordinates(coordinates: coordinates)) { (response: DataResponse<WeatherModel,AFError>) in
            
            guard response.error == nil else {
                completion(nil, response.error?.localizedDescription)
                return
            }
            //             next line will change regarding to your response form
            response.value == nil ?  completion(nil, response.value?.message) : completion(response.value, nil)
        }
        
    }
}


class Main: BaseModel {
    var temp: Float = 0
    
    override func mapping(map: Map) {
        self.temp   <- map["temp"]
    }
    
    
}



class Weather: BaseModel {
    var id: Int = 0
    var description: String = ""
    
    
    override func mapping(map: Map) {
        self.description   <- map["description"]
        self.id            <- map["id"]
    }
}
