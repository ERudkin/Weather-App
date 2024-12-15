//
//  router.swift
//  SwiftUIWeather
//
//  Created by Elliot Joseph on 07/02/2022.
//

import Foundation
import Alamofire
import CoreLocation

enum WeatherService: URLRequestConvertible {
    
    case byName(name: String)
    case byCoordinates(coordinates: CLLocationCoordinate2D)
    
    var APIKey:String { "" }
    var urlString: String {"https://api.openweathermap.org/data/2.5/weather?"}

    var method: HTTPMethod { .get }
    
    func asURLRequest() throws -> URLRequest {
        let url = try urlString.asURL()
        var urlRequest = URLRequest(url: url)
        switch self {
            case .byName(let cityName):
                 urlRequest = try addComponents([
                    URLQueryItem(name: "q", value: cityName),
                    URLQueryItem(name: "appid", value: APIKey),
                    URLQueryItem(name: "units", value: "metric")]) ?? urlRequest
            case .byCoordinates(let coordinates):
                 urlRequest = try addComponents([
                    URLQueryItem(name: "lat", value: String(coordinates.latitude)),
                    URLQueryItem(name: "lon", value: String(coordinates.longitude)),
                    URLQueryItem(name: "units", value: "metric"),
                    URLQueryItem(name: "appid", value: APIKey)]) ?? urlRequest
        }
        
        
        
        urlRequest.httpMethod = method.rawValue
                        
        return urlRequest
    }
    
    
    
    
    
    func getURLRequest(name: String) throws -> URLRequest {
       let url = try urlString.asURL()
       let urlRequest = URLRequest(url: url)
       return urlRequest
     }
        
    func addComponents(_ queryItems: [URLQueryItem]) throws -> URLRequest? {
        var urlComponents = URLComponents(string: self.urlString)
        urlComponents?.queryItems = queryItems
        guard let url:URL = urlComponents?.url else { return nil}
        var urlRequest = URLRequest(url: url)
        urlRequest.method = self.method
        return urlRequest
      }
}
