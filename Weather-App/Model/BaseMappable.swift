//
//  BaseMappable.swift
//  SwiftUIWeather
//
//  Created by Elliot Joseph on 07/02/2022.
//

import Foundation
import ObjectMapper

public protocol BaseMappable: Mappable {
    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    init?(map: Map)
}

class BaseModel: BaseMappable {
    
    required init?(map: Map) {
        
    }
    init() { }
    
    func mapping(map: Map) {
        
    }
}
