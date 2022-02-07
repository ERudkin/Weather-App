//
//  File.swift
//  SwiftUIWeather
//
//  Created by Elliot Joseph on 07/02/2022.
//

import Foundation
import AlamofireObjectMapper
import Alamofire


struct APIManager {
    static func loadRequest<T: BaseMappable>(weatherService:WeatherService, completionHandler: @escaping (AFDataResponse<T>) -> Void) {
        AF.request(weatherService).responseObject() {(response: DataResponse<T,AFError>) in
            
            completionHandler(response)
        }
        
    }
    
}
