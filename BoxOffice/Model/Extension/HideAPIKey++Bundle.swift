//
//  HideAPIKey++Bundle.swift
//  BoxOffice
//
//  Created by redmango, Jusbug on 2023/08/03.
//

import Foundation

extension Bundle {
    var movieApiKey: String {
        guard let file = self.path(forResource: "APIKey", ofType: "plist"),
              let resource = NSDictionary(contentsOfFile: file),
              let key = resource["API_KEY"] as? String else {
            fatalError("Missing APIKEY")
        }
        
        return key
    }
    
    var imageApiKey: String {
        guard let file = self.path(forResource: "APIKey", ofType: "plist"),
              let resource = NSDictionary(contentsOfFile: file),
              let key = resource["IMAGE_API_KEY"] as? String else {
            fatalError("Missing IMAGEAPIKEY")
        }
        
        return key
    }
}
