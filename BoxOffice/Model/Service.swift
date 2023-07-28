//
//  Service.swift
//  BoxOffice
//
//  Created by redmango, Jusbug on 2023/07/28.
//

import Foundation

enum Service {
    case dailyBoxOffice
    case movieDetailInfo
    
    var type: Any {
        switch self {
        case .dailyBoxOffice:
            return BoxOffice.self
        case .movieDetailInfo:
            return Movie.self
        }
    }
    
    var url: URL? {
        var components = URLComponents(string: "https://kobis.or.kr/kobisopenapi/webservice/rest")
        let yesterdayDateString = getTodayDateString()
        var keyQuery: URLQueryItem
        let targetDate = URLQueryItem(name: "targetDt", value: yesterdayDateString)
        
        switch self {
        case .dailyBoxOffice:
            components?.path = "/boxoffice/searchDailyBoxOfficeList.json"
            keyQuery = URLQueryItem(name: "key", value: "f5eef3421c602c6cb7ea224104795888")
        case .movieDetailInfo:
            components?.path = "/movie/searchMovieInfo.json"
            keyQuery = URLQueryItem(name: "key", value: "9edeb739e275f3013ffb896c2ff41cfe")
        }
        
        components?.queryItems?.append(keyQuery)
        components?.queryItems?.append(targetDate)
        
        return components?.url
    }
    
    private func getTodayDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        guard let yesterday = Calendar.current.date(byAdding: .day,
                                                    value: -1,
                                                    to: Date())
        else {
            return ""
        }
        
        let todayDateString = formatter.string(from: yesterday)
        
        return todayDateString
    }
}
